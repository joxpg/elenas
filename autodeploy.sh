git clone https://gitlab.com/efuentesamin/backend_test.git
cd backend_test
docker build -t johantrigos/backend_test_backend-test:latest .
docker login -u johantrigos -p Docker2021
docker push johantrigos/backend_test_backend-test:latest
cd config/k8s
kubectl apply -f template.yml
cd ..
cd ..
cd ..
git clone https://gitlab.com/efuentesamin/frontend_test.git
cd frontend_test 
npm install
npm run-script build
docker build -t johantrigos/frontend_test_frontend-test:latest .
docker login -u johantrigos -p Docker2021
docker push johantrigos/frontend_test_frontend-test:latest
cd config/k8s
kubectl apply -f template.yml