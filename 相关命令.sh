# 1. 更新系统软件源并安装GnuPG核心工具
sudo apt update
sudo apt install gnupg

# 2. （可选）安装图形界面客户端方便密钥管理和操作
sudo apt install kgpg seahorse

# 3. 生成新的密钥对（公钥和私钥）
gpg --full-generate-key
# 说明：
# - 选择密钥类型（一般选择默认RSA和RSA）
# - 选择密钥长度（2048或4096位推荐）
# - 设置密钥有效期（根据需求设定）
# - 输入用户姓名和邮箱（用于标识此密钥）
# - 设置保护私钥的口令

# 4. 查看本地所有公钥列表
gpg --list-keys

# 5. 查看本地所有私钥列表
gpg --list-secret-keys

# 6. 查看特定密钥详细信息和指纹（方便验证身份）
gpg --fingerprint your-email@example.com

# 7. 导出公钥（ASCII格式，便于传输和分享）
gpg --armor --export your-email@example.com > publickey.asc

# 8. 导出私钥（仅限备份，不要泄露）
gpg --armor --export-secret-keys your-email@example.com > privatekey.asc

# 9. 从文件导入公钥（别人发给你的）
gpg --import publickey.asc

# 10. 从文件导入私钥（恢复用）
gpg --import privatekey.asc

# 11. 使用他人公钥加密文件
gpg --encrypt --recipient recipient@example.com file.txt
# 生成加密文件file.txt.gpg

# 12. 使用自己私钥解密文件
gpg --decrypt file.txt.gpg > file_decrypted.txt

# 13. 给文件创建数字签名（将签名保存到独立文件）
gpg --detach-sign file.txt
# 生成file.txt.sig签名文件

# 14. 给文件做内嵌签名（包含内容和签名，文本格式）
gpg --clearsign file.txt
# 生成file.txt.asc文件，带可读签名和内容

# 15. 验证数字签名（独立签名文件）
gpg --verify file.txt.sig file.txt

# 16. 验证内嵌签名文件
gpg --verify file.txt.asc

# 17. 删除本地私钥（谨慎操作）
gpg --delete-secret-key your-email@example.com

# 18. 删除本地公钥
gpg --delete-key your-email@example.com

# 19. 从公钥服务器接收密钥（联网时使用）
gpg --keyserver hkps://keys.openpgp.org --recv-keys KEYID

# 20. 将公钥上传到公钥服务器
gpg --keyserver hkps://keys.openpgp.org --send-keys KEYID

# 21. 列出密钥的信任数据库信息
gpg --list-sigs your-email@example.com

# 22. 导出公钥和私钥的简写方式（用KeyID）
gpg --export KEYID > pubkey.gpg
gpg --export-secret-keys KEYID > privkey.gpg

# 23. 导出所有公钥
gpg --export > all_public_keys.gpg

# 24. 导出所有私钥
gpg --export-secret-keys > all_private_keys.gpg

# 25. 清理和管理缓存的密钥和会话
gpg --delete-trustdb
gpgconf --kill gpg-agent
