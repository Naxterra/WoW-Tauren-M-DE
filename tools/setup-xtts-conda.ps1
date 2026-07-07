param(
    [string] $CondaExe = "C:\Users\nxkt\Anaconda\Scripts\conda.exe",
    [string] $EnvName = "xtts"
)

if (-not (Test-Path -LiteralPath $CondaExe)) {
    throw "conda.exe not found: $CondaExe"
}

& $CondaExe create -n $EnvName python=3.10 -y
& $CondaExe run -n $EnvName python -m pip install --upgrade pip setuptools wheel

# RTX 50-series GPUs need CUDA 12.8 capable PyTorch wheels.
& $CondaExe run -n $EnvName python -m pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
& $CondaExe run -n $EnvName python -m pip install coqui-tts

& $CondaExe run -n $EnvName python -c "import torch; print('torch', torch.__version__); print('cuda available', torch.cuda.is_available()); print('device', torch.cuda.get_device_name(0) if torch.cuda.is_available() else 'cpu')"
