# Installation
conda create -n SE3nv python=3.8
conda activate SE3nv
<!-- conda install pytorch==2.2.1 torchvision==0.17.1 torchaudio==2.2.1 pytorch-cuda=12.1 -c pytorch -c nvidia -->
conda install pytorch==2.1.0 torchvision==0.16.0 torchaudio==2.1.0 pytorch-cuda=12.1 -c pytorch -c nvidia
pip install torchdata
pip install pydantic matplotlib kiwisolver pandas scipy
conda install -c dglteam/label/cu121 dgl
pip install hydra-core pyrsistent
cd env/SE3Transformer
pip install --no-cache-dir -r requirements.txt
python setup.py install
cd ../.. # change into the root directory of the repository
pip install -e . # install the rfdiffusion module from the root of the repository