# Upload files to Baidu Netdisk
pip install bypy
bypy info # 按指示进入网站授权
bypy list  #显示文档
bypy upload filename   #上传文档
bypy -c    #取消令牌文件。一段时间后要重新授权
bypy downdir filename  #下载

# Use LibreOffice software to convert ppt* to pdf.
/Applications/LibreOffice.app/Contents/MacOS/soffice --convert-to pdf *.pptx

# nohup running
nohup ./project.sh 2>&1 &

# 下载文件内链接
wget -i download.txt
# wget google drive file (FILEID, FILENAME)
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=FILEID" -O FILENAME && rm -rf /tmp/cookies.txt

# 解压
# -c: 建立压缩档案; -x：解压; -t：查看内容; -z：有gzip属性的
tar -zxf *.tar.gz
# 解压指定目录下所有zip
find . -name "*.zip" | xargs -n1 unzip
# 压缩
tar -zcf *.tar.gz */

# tensorboard
name=$1
tensorboard --logdir=/project_out/cache/models/${name}/tensorboard/ --port=6006

# 查看tensorboard: 127.0.0.1:16006  or localhost:16006/
ssh -L 16006:127.0.0.1:6006 jinchao@bdda1.itsc.cuhk.edu.hk
tensorboard --logdir=/project_out/cache/models/name/tensorboard/ --port=6006

# 查看活动详情
pgrep -a -U jcli

# ysync 断点续传
rsync -avz --progress local/path/some_file usr@server.com:"/some/path/"

# ffmpeg转成mp4格式
do ffmpeg -i $datapath/$path/$dp/$file -f mp4 -vcodec mpeg4 -r 25 -ar 16000 $datapath/$path/$dest/${file%.*}.mp4

datapath=GRID
dp=video
dest=audio
paths=$(ls $datapath)
for path in $paths; do files=$(ls $datapath/$path/$dp); for file in $files; do ffmpeg -i $datapath/$path/$dp/$file -ac 1 -ar 16000 -vn $datapath/$path/$dest/${file%.*}.wav; done; done

# get file name without the path:
filename=$(basename -- "$fullfile")
extension="${filename##*.}"
filename="${filename%.*}"
~% FILE="example.tar.gz"
~% echo "${FILE%%.*}"
example
~% echo "${FILE%.*}"
example.tar
~% echo "${FILE#*.}"
tar.gz
~% echo "${FILE##*.}"
gz

var="Hello,World"
# 把变量中的第一个字符换成大写 
echo ${var^} 
# 把变量中的所有小写字母，全部替换为大写
echo ${var^^}   
# 把变量中的第一个字符换成小写
echo ${var,}
# 把变量中的所有大写字母，全部替换为小写
echo ${var,,}
