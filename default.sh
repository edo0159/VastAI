#!/bin/bash
# This file will be sourced in init.sh
# Namespace functions with provisioning_

# https://raw.githubusercontent.com/ai-dock/stable-diffusion-webui/main/config/provisioning/default.sh

### Edit the following arrays to suit your workflow - values must be quoted and separated by newlines or spaces.
### If you specify gated models you'll need to set environment variables HF_TOKEN and/or CIVITAI_TOKEN

DISK_GB_REQUIRED=30

APT_PACKAGES=(
    #"package-1"
    #"package-2"
)

PIP_PACKAGES=(
    "onnxruntime-gpu"
)

EXTENSIONS=(
    "https://github.com/deforum-art/sd-webui-deforum"
    "https://github.com/adieyal/sd-dynamic-prompts"
    #"https://github.com/ototadana/sd-face-editor"
    "https://github.com/AlUlkesh/stable-diffusion-webui-images-browser"
    "https://github.com/hako-mikan/sd-webui-regional-prompter"
    "https://github.com/Coyote-A/ultimate-upscale-for-automatic1111"
    "https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper"
    "https://github.com/Bing-su/adetailer"
	"https://github.com/DominikDoom/a1111-sd-webui-tagcomplete"
)

CHECKPOINT_MODELS=(
    #"https://huggingface.co/runwayml/stable-diffusion-v1-5/resolve/main/v1-5-pruned-emaonly.ckpt"
    #"https://huggingface.co/stabilityai/stable-diffusion-2-1/resolve/main/v2-1_768-ema-pruned.ckpt"
    # Hassaku XL
    #"https://civitai.com/api/download/models/575495?type=Model&format=SafeTensor&size=pruned&fp=bf16"
    # Illustrious-XL 0.1
    #"https://civitai.com/api/download/models/889818?type=Model&format=SafeTensor&size=pruned&fp=fp16"
    # noob ai pred 1.0
    #"https://civitai.com/api/download/models/1022833?type=Model&format=SafeTensor&size=full&fp=fp16"
    # NTR MIX XIII
    "https://civitai.com/api/download/models/1166878?type=Model&format=SafeTensor&size=pruned&fp=fp16"
	# Obsession (Illustrious-XL)
	#"https://civitai.com/api/download/models/1136462?type=Model&format=SafeTensor&size=pruned&fp=fp16"
)

LORA_MODELS=(

)

VAE_MODELS=(
    #"https://huggingface.co/stabilityai/sd-vae-ft-ema-original/resolve/main/vae-ft-ema-560000-ema-pruned.safetensors"
    #"https://huggingface.co/stabilityai/sd-vae-ft-mse-original/resolve/main/vae-ft-mse-840000-ema-pruned.safetensors"
    "https://huggingface.co/stabilityai/sdxl-vae/resolve/main/sdxl_vae.safetensors"
)

ESRGAN_MODELS=(
    #"https://huggingface.co/ai-forever/Real-ESRGAN/resolve/main/RealESRGAN_x4.pth"
    #"https://huggingface.co/FacehugmanIII/4x_foolhardy_Remacri/resolve/main/4x_foolhardy_Remacri.pth"
    #"https://huggingface.co/Akumetsu971/SD_Anime_Futuristic_Armor/resolve/main/4x_NMKD-Siax_200k.pth"
)

CONTROLNET_MODELS=(
    #"https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_canny_mid.safetensors"
    #"https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/diffusers_xl_depth_mid.safetensors?download"
    #"https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/t2i-adapter_diffusers_xl_openpose.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_hed-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_mlsd-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_normal-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_scribble-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/control_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_canny-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_color-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_depth-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_keypose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_openpose-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_seg-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_sketch-fp16.safetensors"
    #"https://huggingface.co/webui/ControlNet-modules-safetensors/resolve/main/t2iadapter_style-fp16.safetensors"
)


### DO NOT EDIT BELOW HERE UNLESS YOU KNOW WHAT YOU ARE DOING ###

function provisioning_start() {
    # We need to apply some workarounds to make old builds work with the new default
    if [[ ! -d /opt/environments/python ]]; then 
        export MAMBA_BASE=true
    fi
    source /opt/ai-dock/etc/environment.sh
    source /opt/ai-dock/bin/venv-set.sh webui

    DISK_GB_AVAILABLE=$(($(df --output=avail -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_USED=$(($(df --output=used -m "${WORKSPACE}" | tail -n1) / 1000))
    DISK_GB_ALLOCATED=$(($DISK_GB_AVAILABLE + $DISK_GB_USED))
    provisioning_print_header
    provisioning_get_apt_packages
    provisioning_get_pip_packages
    provisioning_get_extensions
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/ckpt" \
        "${CHECKPOINT_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/lora" \
        "${LORA_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/controlnet" \
        "${CONTROLNET_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/vae" \
        "${VAE_MODELS[@]}"
    provisioning_get_models \
        "${WORKSPACE}/storage/stable_diffusion/models/esrgan" \
        "${ESRGAN_MODELS[@]}"
     
    PLATFORM_ARGS=""
    if [[ $XPU_TARGET = "CPU" ]]; then
        PLATFORM_ARGS="--use-cpu all --skip-torch-cuda-test --no-half"
    fi
    PROVISIONING_ARGS="--skip-python-version-check --no-download-sd-model --do-not-download-clip --port 11404 --exit"
    ARGS_COMBINED="${PLATFORM_ARGS} $(cat /etc/forge_args.conf) ${PROVISIONING_ARGS}"
    
    # Start and exit because webui will probably require a restart
    cd /opt/stable-diffusion-webui-forge
    source "$FORGE_VENV/bin/activate"
    LD_PRELOAD=libtcmalloc.so python launch.py \
        ${ARGS_COMBINED}
    deactivate

    provisioning_print_end
}

function pip_install() {
    "$FORGE_VENV_PIP" install --no-cache-dir "$@"
}

function provisioning_get_apt_packages() {
    if [[ -n $APT_PACKAGES ]]; then
        sudo $APT_INSTALL ${APT_PACKAGES[@]}
    fi
}

function provisioning_get_pip_packages() {
    if [[ -n $PIP_PACKAGES ]]; then
        pip_install ${PIP_PACKAGES[@]}
    fi
}

function provisioning_get_extensions() {
    for repo in "${EXTENSIONS[@]}"; do
        dir="${repo##*/}"
        path="/opt/stable-diffusion-webui-forge/extensions/${dir}"
        if [[ -d $path ]]; then
            # Pull only if AUTO_UPDATE
            if [[ ${AUTO_UPDATE,,} == "true" ]]; then
                printf "Updating extension: %s...\n" "${repo}"
                ( cd "$path" && git pull )
            fi
        else
            printf "Downloading extension: %s...\n" "${repo}"
            git clone "${repo}" "${path}" --recursive
        fi
    done
}

###############################################################################
# ★★ ここから並列ダウンロード化した部分 ★★
###############################################################################
function provisioning_get_models() {
    if [[ -z $2 ]]; then
        return 1
    fi
    
    dir="$1"
    mkdir -p "$dir"
    shift

    # ディスク容量をチェックし、一部のみダウンロードするかを判定
    if [[ $DISK_GB_ALLOCATED -ge $DISK_GB_REQUIRED ]]; then
        arr=("$@")
    else
        printf "WARNING: Low disk space allocation - Only the first model will be downloaded!\n"
        arr=("$1")
    fi

    printf "Downloading %s model(s) to %s...\n" "${#arr[@]}" "$dir"

    # 並列でダウンロードするためのコマンドリストを作成
    local commands=()
    for url in "${arr[@]}"; do
        # シングルクォートのエスケープに注意
        commands+=("provisioning_download '${url}' '${dir}'")
    done

    # provisioning_download 関数をサブシェルでも認識できるようにエクスポート
    export -f provisioning_download

    # ※トークンをサブシェルでも使いたい場合は必要に応じて下記をアンコメント
    # export HF_TOKEN
    # export CIVITAI_TOKEN

    # コマンドを xargs に流し込み、最大5プロセスで並列実行
    # -0 と printf '%s\0' を使うことで、URLにスペースなどがあっても安全に扱える
    printf '%s\0' "${commands[@]}" \
      | xargs -0 -P 5 -I {} bash -c '{}'
}

###############################################################################
# ↑ ここまで並列ダウンロード化した部分 ↑
###############################################################################

function provisioning_print_header() {
    printf "\n##############################################\n#                                            #\n#          Provisioning container            #\n#                                            #\n#         This will take some time           #\n#                                            #\n# Your container will be ready on completion #\n#                                            #\n##############################################\n\n"
    if [[ $DISK_GB_ALLOCATED -lt $DISK_GB_REQUIRED ]]; then
        printf "WARNING: Your allocated disk size (%sGB) is below the recommended %sGB - Some models will not be downloaded\n" "$DISK_GB_ALLOCATED" "$DISK_GB_REQUIRED"
    fi
}

function provisioning_print_end() {
    printf "\nProvisioning complete:  Web UI will start now\n\n"
}

# Download from $1 URL to $2 file path
function provisioning_download() {
    # 認証トークンが必要かどうかを確認
    if [[ -n $HF_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?huggingface\.co(/|$|\?) ]]; then
        auth_token="$HF_TOKEN"
    elif [[ -n $CIVITAI_TOKEN && $1 =~ ^https://([a-zA-Z0-9_-]+\.)?civitai\.com(/|$|\?) ]]; then
        auth_token="$CIVITAI_TOKEN"
    else
        auth_token=""
    fi

    # ダウンロード先のディレクトリとURLを取得
    url="$1"
    download_dir="$2"

    # ダウンロード先ディレクトリを作成
    mkdir -p "$download_dir"

    # ダウンロード先ディレクトリに移動
    pushd "$download_dir" > /dev/null

    # curlコマンドを実行
    if [[ -n $auth_token ]]; then
        curl -L -H "Authorization: Bearer $auth_token" -O -J --progress-bar "$url"
    else
        curl -L -O -J --progress-bar "$url"
    fi

    # 元のディレクトリに戻る
    popd > /dev/null
}

function SetupStartSync(){
############################################
# 送信先サーバー情報・同期ディレクトリ設定
############################################
HOME_SERVER_IP="124.214.53.6"
REMOTE_PORT="3333"
REMOTE_USER="stablediffusion"      # リモートサーバーのSSHログインユーザー名
REMOTE_PASSWORD="nukoedo"          # リモートサーバーのSSHログインパスワード

LOCAL_DIR="/workspace/stable-diffusion-webui-forge/outputs"  # Docker側（送信元）の同期ディレクトリ
REMOTE_DIR="/share/Comic/StableOutput"                       # リモートサーバー側（受信先）のディレクトリ

############################################
# Unison の各種設定
############################################
PROFILE_NAME="sendonly"                 # プロファイル名
PROFILE_FILE="/root/.unison/$PROFILE_NAME.prf"
SSH_WRAPPER="/usr/local/bin/sshpass_ssh"
LOG_FILE="/var/log/unison.log"

############################################
# ここからスクリプト本体
############################################
echo "パッケージリストを更新中..."
sudo apt-get update

echo "Unison と sshpass をインストール中..."
sudo apt-get install -y unison sshpass

sleep 2

echo "Unisonプロファイル用のディレクトリを作成中..."
sudo mkdir -p "$(dirname "$PROFILE_FILE")"

echo "SSHラッパースクリプトを作成中: $SSH_WRAPPER"
sudo tee "$SSH_WRAPPER" > /dev/null <<EOF
#!/bin/bash
exec sshpass -p "$REMOTE_PASSWORD" ssh \\
  -o PreferredAuthentications=password \\
  -o PubkeyAuthentication=no \\
  -o KbdInteractiveAuthentication=no \\
  -o StrictHostKeyChecking=no \\
  -o UserKnownHostsFile=/dev/null "\$@"
EOF

sudo chmod +x "$SSH_WRAPPER"

sudo echo "送信専用Unisonプロファイルを作成中: $PROFILE_FILE"
sudo tee "$PROFILE_FILE" > /dev/null <<EOF
# Unison send-only sync profile
root = $LOCAL_DIR
root = ssh://$REMOTE_USER@$HOME_SERVER_IP:$REMOTE_PORT//$REMOTE_DIR

# sshcmd を指定して、sshpassラッパースクリプトを使う
sshcmd = $SSH_WRAPPER

# force オプションでローカル側をマスターに設定（リモートは常に上書きされる）
force = $LOCAL_DIR

# 下記は自動実行に必要なオプション
auto = true
batch = true
prefer = newer
confirmbigdel = false
EOF

echo "------------------------------"
echo "送信専用Unisonプロファイルの設定が完了しました。"
echo "以下のプロファイルで同期を開始します:"
echo "  $PROFILE_FILE"
echo "------------------------------"

echo "Unisonをバックグラウンドで起動します..."
sudo mkdir -p "$(dirname "$LOG_FILE")"

sudo chmod +x "$LOG_FILE"

# -ui text : CUIモードで実行
# "$PROFILE_NAME": プロファイル名(=sendonly.prf)を指定
nohup sudo unison -ui text "$PROFILE_NAME" -repeat 7 > "$LOG_FILE" 2>&1 &

echo "Unisonがバックグラウンドで起動しました。"
echo "ログファイル: $LOG_FILE"
echo "パスワードの入力なしで定期的に同期を実行します。"
}

provisioning_start
SetupStartSync
