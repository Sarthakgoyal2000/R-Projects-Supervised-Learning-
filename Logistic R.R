input <- diabetes[,c("Pregnancies","Glucose","BloodPressure","Outcome","Insulin")]
model = glm(formula = Outcome ~ Pregnancies + Glucose + BloodPressure,Insulin, data = input, family = binomial)
print(summary(model))
p = data.frame(Pregnancies = 6 ,Glucose = 122 , BloodPressure = 40,Insulin=0)
predict(model,newdata=p,type='response')