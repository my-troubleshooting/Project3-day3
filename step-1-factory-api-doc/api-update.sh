
redoc-cli bundle openapi.yaml # redoc-cli를 통해 Dockerfile에서 요구하는 html 파일을 만들었다.
mv redoc-static.html index.html # 만들어진 html 파일의 이름을 Dockerfile에서 요구하는 index.html의 명칭으로 바꿨다.


ssh -i ~/Test/practice.pem ubuntu@ec2-3-39-223-232.ap-northeast-2.compute.amazonaws.com cd /home/ubuntu #현재 EC2 내에서 위치를 ubuntu로 이동시켰다.
scp -i ~/Test/practice.pem ./index.html ubuntu@3.39.223.232:/home/ubuntu/index.html # 이동한 위치에 Dockerfile이 있으므로 그 위치에 index.html을 옮겼다.
ssh -i ~/Test/practice.pem ubuntu@ec2-3-39-223-232.ap-northeast-2.compute.amazonaws.com sudo docker build -t akeka0303/factory-api . #index.html이 있는 현재위치의 파일을 이미지 빌드했다.
ssh -i ~/Test/practice.pem ubuntu@ec2-3-39-223-232.ap-northeast-2.compute.amazonaws.com sudo docker rm -f factory-api # docker rm을 네임형식으로 진행했다. (run할 때 --name이 없으면 인식을 못함)
ssh -i ~/Test/practice.pem ubuntu@ec2-3-39-223-232.ap-northeast-2.compute.amazonaws.com sudo docker run -d -p 8080:80 --name factory-api akeka0303/factory-api #컨테이너를 실행시킬 때 컨테이너 이름을 명확하게 주기위해 --name 옵션을 활용했다.
