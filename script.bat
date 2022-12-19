echo "Criando as imagens..."

docker build -t denilsonbonatti/projeto-backend:1.0 backend/ -
docker build -t denilsonbonatti/projeto-database:1.0 database/ -

echo "Realizando o push das imagens..."

docker push -t denilsonbonatti/projeto-backend:1.0
docker push -t denilsonbonatti/projeto-database:1.0

echo "Criando servicços no cluster kubernets..."

kubctl apply -f ./services.yml

echo "Criando deployments..."

kubctl apply -f ./deployment.yml