#!/bin/bash
GREEN='\033[0;32m'
NC='\033[0m'

printf "${GREEN}Python virtual environment creation${NC}\n"
python3 -m venv .env

printf "${GREEN}Python virtual environment activation${NC}\n"
source .env/bin/activate

printf "${GREEN}Installing dependencies${NC}\n"
pip install -r requirements.txt

printf "${GREEN}Training and saving the model in the bentoml moedl registry${NC}\n"
python train_save.py

cd model

printf "${GREEN}Building the Bento${NC}\n"
bentoml build

printf "${GREEN}Dockerizing the Bento${NC}\n"
bentoml containerize iris_classifier:latest

printf "${GREEN}Follow the instruction above for the deploy on Docker.${NC}\n"
printf "${GREEN}Then run ${NC}python3 request.py\n"
