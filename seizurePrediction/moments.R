library(moments)

##counts
count <- function(vector, whatToCount)
{
  
  ##returns the frequency of "whatToCount" in some "vector"
  
  count = 0
  for(i in 1:length(vector))
  {
    if(vector[i] == whatToCount)
      count = count + 1 
  }
  count
}

#calculate moments of preIctal data
preIctal_minData = apply(preIctal_data[[1]], 1, min)                   ##c(1, 2) => across all rows(1) and columns(2)
preIctal_maxData = apply(preIctal_data[[1]], 1, max)                   ##c(1, 2) => across all rows(1) and columns(2)
preIctal_meanData = apply(preIctal_data[[1]], 1, mean)
preIctal_varData = apply(preIctal_data[[1]], 1, var)
preIctal_skewnessData = apply(preIctal_data[[1]], 1, skewness)
preIctal_kurtosisData = apply(preIctal_data[[1]], 1, kurtosis)


# print("preIctal phase: ")
# print(preIctal_minData)
# print(preIctal_maxData)
# print(preIctal_meanData)
# print(preIctal_varData)



##calculate moments of interIctal data
interIctal_minData = apply(interIctal_data[[1]], 1, min)                   ##c(1, 2) => across all rows(1) and columns(2)
interIctal_maxData = apply(interIctal_data[[1]], 1, max)                   ##c(1, 2) => across all rows(1) and columns(2)
interIctal_meanData = apply(interIctal_data[[1]], 1, mean)
interIctal_varData = apply(interIctal_data[[1]], 1, var)
interIctal_skewnessData = apply(interIctal_data[[1]], 1, skewness)
interIctal_kurtosisData = apply(interIctal_data[[1]], 1, kurtosis)



# print("InterIctal phase: ")
# print(interIctal_minData)
# print(interIctal_maxData)
# print(interIctal_meanData)
# print(interIctal_varData)

##comparison of moments
minVS = preIctal_minData < interIctal_minData
maxVS = preIctal_maxData < interIctal_maxData
meanVS = preIctal_meanData < interIctal_meanData
varVS = preIctal_varData < interIctal_varData
skewnessVS = preIctal_skewnessData < interIctal_skewnessData
kurtosisVS = preIctal_kurtosisData < interIctal_kurtosisData

print(count(minVS, T))
print(count(maxVS, T))
print(count(meanVS, T))
print(count(varVS, T))
print(count(skewnessVS, T))
print(count(kurtosisVS, T))