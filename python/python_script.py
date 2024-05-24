import os

##### Carpeta dataset #####
location = 'C:/Users/andyc/OneDrive/Escritorio/proyecto_parcial/python/dataset'

##### Validar si existe carpeta #####
if not os.path.exists(location):
    ## Si la carpeta no existe, la creo ##
    os.mkdir(location)
else: ## Carpeta existe ##
    ## Borrar contenido ##
    for root, dirs, files in os.walk(location, topdown=False):
        for name in files:
            os.remove(os.path.join(root,name)) #Eliminar los archivos
        for name in dirs:
            os.rmdir(os.path.join(root,name)) #Eliminar las carpetas

### Importar libreria API Kaggle ###
from kaggle.api.kaggle_api_extended import KaggleApi

### Autenticarnos ###
api = KaggleApi()
api.authenticate()

## visualizar los dataset ##
# print(api.dataset_list(search='')) #

### Descargar dataset ###
api.dataset_download_files('rahulvyasm/netflix-movies-and-tv-shows',path=location,force=True,quiet=False,unzip=True)




