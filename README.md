# Elenas 

A continuación se presenta una solución para el caso propuesto por Elenas donde se despliega un backend y un frontend.


![Elenas](https://user-images.githubusercontent.com/1924809/128785803-2ad2b3ac-0071-4fe9-a56e-ee9fed62b871.png)


Con el fin de cumplir los requerimientos de un escalamiento horizontal, se propone la implementaciòn de contenedores en Kubernetes con minimo 2 nodos por backend y asì mismo para frontend y con Horizontal POD autoscaler que estèn monitoreando la cpu y memoria de los pod para aumentar o mantener la capacidad en picos altos de trafico.
 
Asì mismo con el fin de mantener una alta disponibilidad, minimo se recomiendan 2 pods para backend y frontend. Importante para mantener el uptime cerca al 100%  en estos depliegues se recomienda la implementaciòn de RollingUpdate en los deployment con el fin que la actualizaciòn se haga de forma continua y escalonada.


#

### Prerequisitos
-Docker instalado (https://docs.docker.com/engine/install/)

-Minikube (https://minikube.sigs.k8s.io/docs/start/)

-Correr en una terminal el comando 

``` minikube tunnel```

-Conexiòn a internet estable
#
### Deploy

Se debe correr en una terminal el siguiente comando
``` sh autodeploy.sh ```

Es sh realizará los siguientes pasos:

- Irá a cada aplicación (Front end y backend) y realizará la construcciòn de los contenedores
- Publicará los contedores en docker hub
- Realizará la aplicación de los manifiestos de Kubernetes que estan ubicados en cada proyecto en la carpeta config/k8s donde se crea Namesapce, deployments, service y secretos necesarios para poner a correr y disponibilizar al publico la aplicación.
- Una vez todo esté andando se puede visualizar en K8S que las aplicaciones están corriendo con el comando
   ``` kubectl get pods -n backend-test ```
   ``` kubectl get pods -n frontend-test ```
- Se realiza la prueba ingresando a la URL http://10.104.234.237:4200/ donde se visualizará la aplicación andando:

![Captura de pantalla de 2021-08-09 18-41-45](https://user-images.githubusercontent.com/1924809/128787726-54e8829d-1273-457d-9a45-c5c1bf857705.png)

Tener en cuenta que se realizó una modificación al código para que mostrara el hostname del pod que está atendiendo la petición con el fin de realizar pruebas de downtime.
#
