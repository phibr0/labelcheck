# -*- coding: utf-8 -*-
"""Facharbeit.ipynb

Automatically generated by Colaboratory.

Original file is located at
    https://colab.research.google.com/drive/1ty_QQlL038YT6KpBjSdqGvIGyH0YXwxW

# Trainieren des Beispiel NN's aus Kapitel 2

In diesem Teil wird das Beispiel NN aus Kapitel 2 meiner Facharbeit trainiert.
Das MNIST Dataset enthält Bilder von Handgeschriebenen Ziffern mit einer Größe von 28x28 Pixeln.

**Der Code kann direkt hier im Browser ausgeführt und auch verändert werden.**

Das trainierte Modell wird anschließend als 'beispielModel_MNIST' gespeichert.

## Wieso nutze ich Colab anstatt auf meinem eigenen Computer zu trainieren?

Hier habe ich Zugriff auf deutlich stärkere GPUs und TPUs als die in meinem eigenen Computer was mir Zeit spart.
"""

#@title Variablen { form-width: "30%", display-mode: "both" }
import tensorflow as tf
import tensorflow.keras.layers as layers
import numpy as np

numOfNeuronsIn1 = 16 #@param {type:"slider", min:1, max:256, step:1}
numOfNeuronsIn2 = 16 #@param {type:"slider", min:1, max:256, step:1}
numOfEpochs = 10 #@param {type:"slider", min:1, max:256, step:1}

mnist = tf.keras.datasets.mnist

(x_train, y_train), (x_test, y_test) = mnist.load_data() # Laden des MNIST Datasets
# Und aufteilen in Trainigsdaten und Testdaten

x_train = tf.keras.utils.normalize(x_train, axis=1) # Normalisieren des Datasets
x_test = tf.keras.utils.normalize(x_test, axis=1)

model = tf.keras.models.Sequential() ## Erstellen des Neuronalen Netzwerks
model.add(layers.Flatten())
model.add(layers.Dense(numOfNeuronsIn1, activation=tf.nn.sigmoid)) # Hinzufügen der Layer
model.add(layers.Dense(numOfNeuronsIn2, activation=tf.nn.sigmoid))
model.add(layers.Dense(10, activation=tf.nn.softmax))

model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy']) # Kompilieren der Layer zu einem trainierfähigen Modell

model.fit(x_train, y_train, epochs=numOfEpochs,validation_split=0.1) # Trainieren des Modells mit den Trainingsdaten und x Epochen

model.save('beispielModel_MNIST') # Speichern des Modells

"""# Erstellen der Trainingsdaten für Labelcheck und anschließendes trainieren

Dokumentation: https://www.tensorflow.org/tutorials/load_data/images
"""

# Commented out IPython magic to ensure Python compatibility.
import numpy as np
import os
import datetime
import tensorflow as tf
from tensorflow.keras import layers
import tensorboard

batch_size = 16
img_height = 180
img_width = 180
data_dir='/content/drive/MyDrive/dataset'
AUTOTUNE = tf.data.AUTOTUNE

train_ds = tf.keras.preprocessing.image_dataset_from_directory( # Aufteilen der Daten in Trainingsdaten
  data_dir,
  validation_split=0.22,
  subset='training',
  seed=123,
  image_size=(img_height, img_width),
  batch_size=batch_size)

val_ds = tf.keras.preprocessing.image_dataset_from_directory( # und Testdaten
  data_dir,
  validation_split=0.22,
  subset="validation",
  seed=123,
  image_size=(img_height, img_width),
  batch_size=batch_size)

class_names = train_ds.class_names
print('\nClass Names: ' + str(class_names) + '\n') # Ausgeben der Klassen

train_ds = train_ds.cache().shuffle(buffer_size=1000).prefetch(buffer_size=AUTOTUNE) # I/O Operationen sind in Colab sehr langsam,
val_ds = val_ds.cache().shuffle(buffer_size=1000).prefetch(buffer_size=AUTOTUNE) # durch die Methoden cache() und prefetch() werden die Daten im RAM gehalten

model = tf.keras.Sequential([
  layers.experimental.preprocessing.Rescaling(1./255),# Normalisieren der Daten, vorher waren die Daten 0-255, jetzt 0-1
  layers.experimental.preprocessing.RandomTranslation(0.1, 0.1),# Data Augmentation - Leichte zufällige Veränderungen des Bildes "um das Dataset zu verändern"
  layers.experimental.preprocessing.RandomRotation(0.12),# Data Augmentation
  layers.Conv2D(64, 5, activation='relu'),# Convoultional Layer
  layers.Dropout(0.1), # Lässt Daten aus, hilft gegen Overfitting
  layers.Conv2D(48, 3, activation='relu'),
  layers.MaxPooling2D(),# Max Pooling Layer
  layers.Conv2D(32, 3, activation='relu'),
  layers.MaxPooling2D(),
  layers.Conv2D(32, 3, activation='relu'),
  layers.MaxPooling2D(),
  layers.Flatten(),# 2D Layer --> 1D 
  layers.Dense(48, activation='relu'), # Normale Layer
  layers.Dense(24, activation='relu'),
  layers.Dense(len(class_names), activation='sigmoid')
])

model.compile(
  optimizer='adam',# Gradient Descent mit Momentum (und mehr)
  loss=tf.losses.SparseCategoricalCrossentropy(from_logits=True),
  metrics=['accuracy'])

logdir = os.path.join("logs", datetime.datetime.now().strftime("%Y%m%d-%H%M%S"))
tensorboard_callback = tf.keras.callbacks.TensorBoard(logdir, histogram_freq=1)

model.fit(
  train_ds,
  validation_data=val_ds,
  epochs=160,
  shuffle=True,
  callbacks=[tensorboard_callback]
)

converter = tf.lite.TFLiteConverter.from_keras_model(model) # Konvertieren des Keras Models in ein TensorFlow-Lite Model
tflite_model = converter.convert()

with open('model.tflite', 'wb') as f: # Speichern des Models
  f.write(tflite_model)

tf.keras.utils.plot_model(
    model, to_file='model.png', show_shapes=True, show_dtype=False,
    show_layer_names=False, rankdir='TD', expand_nested=False, dpi=96
)

# Achtung: Das ist kein Python Code, funktioniert aber in Colab Notebooks um das TensorBoard zu öffnen,
# TensorBoard ist eine Web App um den Tainingsprozess zu analysieren
# %load_ext tensorboard
# %tensorboard --logdir logs