echo "gpus with errors:"
sudo cat /var/log/syslog | grep NVRM
echo "***********************************"

echo "gpus on server:"
lspci | grep -i vga
echo "***********************************"

echo "gpus on nvidia-smi:"
nvidia-smi -a | grep -i bus
echo "***********************************"

echo "gpus on phisical slot:"
sudo dmidecode -t 9 | awk '/ID:/ {id=$2} /Bus Address/ {print "Slot",id,"PCIe",$3}'

