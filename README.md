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

![VMware Kurulum](images/vmware_setup.png.png)
![Zabbix Host Ekleme](images/zabbix_host_add.png.png)
![Zabbix Dashboard](images/zabbix_dashboard.png.png)
![Zabbix İzleme](images/zabbix_izleme.png.png)

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
