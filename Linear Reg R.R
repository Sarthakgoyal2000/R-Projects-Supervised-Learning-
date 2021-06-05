#Linear Regression
relation <- lm(insurance$age~insurance$bmi)

a =  data.frame(insurance$bmi = 27.900)
result1 =  predict(relation,a)
print(result1)

#Multiple
input = insurance[,c("age","bmi","smoker","charges",'children')]
model = lm(charges~age+bmi+smoker, data = input)
print(model)
a <- coef(model)[1]
print(a)

Xage <- coef(model)[2]
Xbmi <- coef(model)[3]
Xsmoker <- coef(model)[4]
Xchild <- coef(model)[5]

print(Xage)
print(Xbmi)
print(Xsmoker)
print(Xchild)

newdata = data.frame(age = 19 ,bmi = 27.90 , smoker = 'yes')
predict(model,newdata)

