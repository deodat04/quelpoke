# QUELPOKE README

## Language
go

## Protocole & Port 
- protocole : http
- port : 8080

## Service
Quel pokémon êtes-vous?

## Dépendance
- pokeapi.co

## RUNNING (with Dockerfile)
`docker build -t quelpoke-go:1.0 .` 

`docker run -p 8080:8080 quelpoke-go:1.0` 

## Process docker & GCP
- Après avoir build l'image
`docker build -t quelpoke-go:1.0 .`

- Tager l'image
`docker tag quelpoke-go:1.0 \
europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0`

- Pusher l'image
`docker push europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0`

- Se connecter a GCP
`gcloud auth login deodat@copy-paste.pro`
ou `gcloud auth login` puis renseigner la bonne adresse mail

- Vérifier le projet
`gcloud config set project cs-poc-hpzdycpiqjyvinhrczvlwcn`

- Vérifier la configuration
`gcloud auth configure-docker europe-west9-docker.pkg.dev`

- Pusher le dossier sur GCP
`docker push europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0`

## Process kubernetes
- Appliquer un objet après l'avoir créé dans le fichier yaml
`kubectl apply -f namespace.yaml`

## Quelques commandes utiles

`kubectl get namespaces`

`kubectl get pods -n deodat`

`kubectl port-forward service/quelpoke 8080:8080 -n deodat`

`kubectl config set-context --current --namespace=deodat`

`kubectl logs <nom de pod> -n deodat`

- 