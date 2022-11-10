import bentoml
from sklearn import svm

model = bentoml.sklearn.load_model("iris_clf:latest")
print(model)
