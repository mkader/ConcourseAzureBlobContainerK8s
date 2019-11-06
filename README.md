Concourse                  
Azure Blob Storage            
Azure Container Registary              
Azure K8s                     
Sonar Qube Code Analysis                    
Coverlet Code coverage                 

Run using fly
fly -t rs set-pipeline -c pipeline-ver6.yml -p pipeline-ver6 --load-vars-from "variables.yml"

Defined all values in variables.yml

![alt text](https://github.com/mkader/ConcourseAzureBlobContainerK8s/blob/master/images/pipeline.png)              

![alt text](https://github.com/mkader/ConcourseAzureBlobContainerK8s/blob/master/images/pipeline-code-analysis.PNG)


