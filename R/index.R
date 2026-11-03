library(mlr3)
library(mlr3oml)
#Download an open ML task
oml_task<-otsk(id=59)
#Convert open ML task to mlr3 Task
task_iris<- as_task(oml_task)
task_iris
#output
#• Target: class
#• Properties: multiclass
#• Features (4):
#• dbl (4): petallength, petalwidth, sepallength, sepalwidth
#• Target classes: Iris-setosa (33%), Iris-versicolor (33%), Iris-virginica (33%)

#Inspect the task

#Task type is classification

#Task is multiclass
#Iris-setosa (33%), Iris-versicolor (33%), Iris-virginica (33%)
task_iris$feature_names
#There are 4 features on the basis of which class is predicted
#"sepallength" "sepalwidth"  "petallength" "petalwidth"
task_iris$target_names
#Target is class
task_iris$task_type
task_iris$target_names

#Task use
learner<-lrn("classif.rpart")
learner$train(task_iris)
prediction<-learner$predict(task_iris)
prediction$score(msr("classif.acc"))

#Second dataset
#Download the openml task and make it mlr3 task

oml_task2=otsk(id=3)
task_kr_vs_kp=as_task(oml_task2)

#inspect it
task_kr_vs_kp

#Target: class
#• Properties: twoclass
#• Features (36):
# • fct (36): bkblk, bknwy, bkon8, bkona, bkspr, bkxbq, bkxcr, bkxwp, blxwp, bxqsq, cntxt, dsopp, dwipd,
#hdchk, katri, mulch, qxmsq, r2ar8, reskd, reskr, rimmx, rkxwp, rxmsq, simpl, skach, skewr, skrxp,
#spcop, stlmt, thrsk, wkcti, wkna8, wknck, wkovl, wkpos, wtoeg
#• Target classes: won (positive class, 52%), nowin (48%)

#Target is classifying into 2 classes
#Target classes -  won (positive class, 52%), nowin (48%)
# 36 Features on the basis of which class is predicted

#Task Use

learner<-lrn("classif.rpart")
learner$train(task_kr_vs_kp)
prediction<-learner$predict(task_kr_vs_kp)
prediction$score(msr("classif.acc"))






