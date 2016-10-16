apt-get update -y
apt-get upgrade -y
apt-get install git -y
su -c "git clone https://github.com/refractionPOINT/limacharlie.git -b develop" `logname`
cd limacharlie/cloud/infrastructure/
su -c "touch install_log.txt" `logname`
python ./1_install_single_node_test_cluster.py &>> install_log.txt
su -c "python ./2_start_single_node_test_cluster.py &>> install_log.txt" `logname`
su -c "python ./3_configure_single_node_test_cluster.py &>> install_log.txt" `logname`