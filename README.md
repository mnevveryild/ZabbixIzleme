# VMware Üzerinde Zabbix ile Sunucu İzleme Projesi

Bu proje, VMware üzerinde kurulan sanal makinelerin **Zabbix** izleme sistemi ile nasıl izlenebileceğini adım adım göstermektedir.  
Proje kapsamında VMware üzerinde Linux tabanlı üç ayrı sanal makine kurulmuş ve Zabbix Agent ile Zabbix Server entegrasyonu sağlanmıştır. Böylece uzaktan sunucuların hareketleri ve durumları takip edilmiştir.
Aynı zamanda bazı triggerlar girilerek uyarılar verilmesi istenmiştir. Örneği CPU kullanımı %80 nin üstüne çıkarsa WARNING uyarısı verilmesi gibi.

Projenin devamında bilgi güvenliği kapsamında güvenlik duvarını kullanarak parola, hatalı giriş denemesi gibi bazı güvenlik ayarları da yapılmıştır.

---

## 🚀 Proje Adımları

### 1. VMware Üzerinde Sanal Makine Kurulumu
- VMware Workstation/ESXi kullanılarak Ubuntu Server ISO’su ile yeni bir VM oluşturuldu.
- CPU, RAM ve disk yapılandırmaları yapıldı.
- Ağ ayarları **Bridged** modda olacak şekilde ayarlandı.
- Kurulum sonrası IP adresi `ip a` komutu ile kontrol edildi.

### 2. Zabbix Agent Kurulumu
Ubuntu üzerinde:
```bash
sudo apt update
sudo apt install zabbix-agent -y
```

`/etc/zabbix/zabbix_agentd.conf` dosyası düzenlendi:
```ini
Server=ZABBIX_SERVER_IP
Hostname=VM_NAME
```

Agent başlatıldı:
```bash
sudo systemctl enable zabbix-agent
sudo systemctl start zabbix-agent
```

### 3. Zabbix Server Üzerinden Host Ekleme
- **Configuration > Hosts > Create host** adımları izlenerek VM eklendi.
- Hostname ve IP bilgileri girildi.
- **Template OS Linux** atanarak izleme başlatıldı.

---

## 📷 Ekran Görüntüleri
> Aşağıdaki görseller, kurulum ve izleme sürecini göstermektedir.

Zabbix Kurulumu 
<img width="842" height="588" alt="imagesvmware_setup png" src="https://github.com/user-attachments/assets/86beac39-e95c-4c23-91f7-99abf898492a" />
Zabbix Host Ekleme
<img width="1477" height="940" alt="imageszabbix_host_add png" src="https://github.com/user-attachments/assets/cb068fe7-bca4-4bee-9b1c-072b5e51a159" />
Zabbix Dashboard
<img width="1480" height="931" alt="imageszabbix_dashboard png" src="https://github.com/user-attachments/assets/07eb6edb-9402-4e12-9e18-43cccbe3aab4" />
Zabbix İzleme Örneği
<img width="1477" height="932" alt="imageszabbix_izleme png" src="https://github.com/user-attachments/assets/a3af99f5-3d17-49c3-8021-1e20d9a7e1fd" />



---

## 🛠 Kullanılan Teknolojiler
- VMware Workstation 17
- Ubuntu 24
- Ubuntu 22.04
- Windows Server 2019
- Zabbix Agent 6.x


---

## 📄 Lisans
Bu proje MIT Lisansı ile lisanslanmıştır. Detaylar için [LICENSE](LICENSE) dosyasına bakabilirsiniz.
