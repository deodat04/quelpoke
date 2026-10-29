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

---

## RUNNING (with Dockerfile)

```bash
docker build -t quelpoke-go:1.0 .
```

```bash
docker run -p 8080:8080 quelpoke-go:1.0
```

---

## Process docker & GCP

- Après avoir build l'image

```bash
docker build -t quelpoke-go:1.0 .
```

- Tager l'image

```bash
docker tag quelpoke-go:1.0 \
europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0
```

- Pusher l'image

```bash
docker push europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0
```

- Se connecter a GCP

```bash
gcloud auth login deodat@copy-paste.pro
```

ou `gcloud auth login` puis renseigner la bonne adresse mail

- Vérifier le projet

```bash
gcloud config set project cs-poc-hpzdycpiqjyvinhrczvlwcn
```

- Vérifier la configuration

```bash
gcloud auth configure-docker europe-west9-docker.pkg.dev
```

- Pusher le dossier sur GCP

```bash
docker push europe-west9-docker.pkg.dev/cs-poc-hpzdycpiqjyvinhrczvlwcn/student-deodat/quelpoke-go:1.0
```

---

## Process kubernetes

- Appliquer un objet après l'avoir créé dans le fichier yaml

```bash
kubectl apply -f namespace.yaml
```

## Quelques commandes utiles

```bash
kubectl get namespaces
```

```bash
kubectl get pods -n deodat
```

```bash
kubectl port-forward service/quelpoke 8080:8080 -n deodat
```

```bash
kubectl config set-context --current --namespace=deodat
```

```bash
kubectl logs <nom de pod> -n deodat
```

---

## Helm

Après avoir crée les fichiers de configs :

- Vérifier les erreurs de syntaxe : `helm lint .`
- Installer le chart(déployer les objets) : `helm install quelpoke . -n deodat`

### Commandes helm utiles

```bash
helm list -n deodat                      # voir les releases
helm upgrade quelpoke . -n deodat        # appliquer une modif
helm upgrade quelpoke . -n deodat --set image.tag=1.2   # changer le tag à la volée
helm history quelpoke -n deodat          # historique des révisions
helm rollback quelpoke 1 -n deodat       # revenir à la révision 1
helm uninstall quelpoke -n deodat        # tout supprimer d'un coup
```

### Avantages helm

- Une seule commande pour déployer, mettre à jour ou supprimer tous les objets, au lieu de plusieurs `kubectl apply`.
- Pas de duplication : l'image, le namespace ou le nom sont définis une seule fois et réutilisés partout.
- Réutilisable par environnement : un `values-prod.yaml` différent de `values-dev.yaml` suffit, avec `helm install -f values-prod.yaml`.
- Rollback facile : Helm garde l'historique des versions déployées.
- Versionnable et partageable : la chart peut être packagée (`helm package .`) et publiée dans un registre.
- Gestion du cycle de vie : Helm sait quels objets appartiennent à la release, donc il nettoie correctement à la désinstallation.