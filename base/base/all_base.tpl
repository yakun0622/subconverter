{% if request.target == "clash" or request.target == "clashr" %}

port: {{ global.clash.http_port }}
socks-port: {{ global.clash.socks_port }}
allow-lan: {{ global.clash.allow_lan }}
mode: Rule
log-level: {{ global.clash.log_level }}
external-controller: :9090
{% if request.clash.dns == "1" %}
dns:
  enabled: true
  listen: 1053
{% endif %}
{% if local.clash.new_field_name == "true" %}
proxies: ~
proxy-groups: ~
rules: ~
{% else %}
Proxy: ~
Proxy Group: ~
Rule: ~
{% endif %}

{% endif %}
{% if request.target == "surge" %}

[General]
loglevel = notify
bypass-system = true
skip-proxy = 127.0.0.1,192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,100.64.0.0/10,localhost,*.local,e.crashlytics.com,captive.apple.com,::ffff:0:0:0:0/1,::ffff:128:0:0:0/1
#DNS设置或根据自己网络情况进行相应设置
bypass-tun = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12
dns-server = 119.29.29.29,223.5.5.5

[Script]
http-request https?:\/\/.*\.iqiyi\.com\/.*authcookie= script-path=https://raw.githubusercontent.com/NobyDa/Script/master/Surge/iQIYI-DailyBonus/iQIYI_GetCookie.js

{% endif %}
{% if request.target == "loon" %}

[General]
skip-proxy = 192.168.0.0/16,10.0.0.0/8,172.16.0.0/12,localhost,*.local,e.crashlynatics.com
bypass-tun = 10.0.0.0/8,100.64.0.0/10,127.0.0.0/8,169.254.0.0/16,172.16.0.0/12,192.0.0.0/24,192.0.2.0/24,192.88.99.0/24,192.168.0.0/16,198.18.0.0/15,198.51.100.0/24,203.0.113.0/24,224.0.0.0/4,255.255.255.255/32
dns-server = system,119.29.29.29,223.5.5.5
allow-udp-proxy = false
host = 127.0.0.1

[Proxy]

[Remote Proxy]

[Proxy Group]

[Rule]

[Remote Rule]

[URL Rewrite]
enable = true
^https?:\/\/(www.)?(g|google)\.cn https://www.google.com 302

[Remote Rewrite]
https://raw.githubusercontent.com/Loon0x00/LoonExampleConfig/master/Rewrite/AutoRewrite_Example.list,auto

[MITM]
hostname = *.example.com,*.sample.com
enable = true
skip-server-cert-verify = true
#ca-p12 =
#ca-passphrase =

{% endif %}
{% if request.target == "quan" %}

[SERVER]

[SOURCE]

[BACKUP-SERVER]

[SUSPEND-SSID]

[POLICY]

[DNS]
1.1.1.1

[REWRITE]

[URL-REJECTION]

[TCP]

[GLOBAL]

[HOST]

[STATE]
STATE,AUTO

[MITM]

{% endif %}
{% if request.target == "quanx" %}

[general]
profile_img_url=https://github.githubassets.com/images/modules/site/integrators/google.png
excluded_routes=192.168.0.0/16, 172.16.0.0/12, 100.64.0.0/10, 10.0.0.0/8
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://github.com/KOP-XIAO/QuantumultX/raw/master/Scripts/IP_API.js
network_check_url=http://www.baidu.com/
server_check_url=http://www.gstatic.com/generate_204

[dns]
server=119.29.29.29
server=223.5.5.5
server=1.0.0.1
server=8.8.8.8

[policy]
static=♻️ 自动选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Auto.png
static=🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Proxy.png
static=🌍 国外媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/GlobalMedia.png
static=🌏 国内媒体, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/DomesticMedia.png
static=Ⓜ️ 微软服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Microsoft.png
static=📲 电报信息, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Telegram.png
static=🍎 苹果服务, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Apple.png
static=🎯 全球直连, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Direct.png
static=🛑 全球拦截, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Advertising.png
static=🐟 漏网之鱼, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Final.png
static=🎶 TikTok, 🔰 节点选择, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/TikTok.png

[server_remote]

[filter_remote]

[rewrite_remote]
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag=lhie1改版, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Js_local_WorkingCopy.conf, tag=nzw9314脚本, enabled=true
https://raw.githubusercontent.com/nzw9314/QuantumultX/master/Get_Cookie_New.conf, tag=nzw9314获取Cookie, enabled=false
https://raw.githubusercontent.com/chavyleung/scripts/master/QuantumultX_AppStore_Local_Cookie.conf, tag=chavyleung获取Cookie, enabled=false

[server_local]

[filter_local]

[rewrite_local]
#京东签到获取cookie
#https:\/\/api\.m\.jd\.com\/client\.action.*functionId=signBean url script-request-header NobyDa/JD-DailyBonus/JD_DailyBonus.js
# 饿了么 (By @syzzzf)
#^https:\/\/h5\.ele\.me\/restapi\/eus\/v\d\/current_user$ url script-request-header nzw9314/Task/elemGetCookies.js
#什么值得买 去主屏广告 (By @Primovist)
^https?:\/\/homepage-api\.smzdm\.com\/home\?ad url script-response-body SMZDM.js
#几鸡机场 签到
^https?:\/\/ji-bc\.pw\/xiaomao\/user url script-request-header jiji.cookie.js

[task_local]
#京东多合一签到
15 0 * * * NobyDa/JD-DailyBonus/JD_DailyBonus.js, tag=京东签到, enabled=true
# 电信营业厅
#打开 APP 手动签到一次: 访问下右下角 `我` > `签到` (头像下面)
16 7 * * * chavyleung/10000/10000.js, tag=电信签到, enabled=true
#联通签到
17 7 * * * chavyleung/10010/10010.js, tag=联通签到, enabled=true
#什么值得买，访问并登录: https://zhiyou.smzdm.com/user/login
18 7 * * * chavyleung/smzdm/quanx/smzdm.js, tag=什么值得买签到, enabled=true
# 饿了么   (By @syzzzf)
#打开 APP, 访问下`我的`>`签到领红包`(左上角)
19 7 * * * nzw9314/Task/elemSign.js, tag=饿了么签到, enabled=true
#几鸡签到
20 7 * * * jiji.js, tag=几鸡签到, enabled=true
# 微信小程序-活动抽奖 (By @makexp & @zZPiglet)
#打开微信小程序 进入"活动抽奖"，手动签到一次或点击"已签到"
30 20 * * * nzw9314/Task/WeChatLottery_new.js, tag=小程序抽奖签到, enabled=true

[mitm]
hostname = ji-bc.pw, *.smzdm.com, api.m.jd.com, h5.ele.me
passphrase=g[&Bq(7(ME.X2w-v\K(K
p12=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

{% endif %}
{% if request.target == "mellow" %}

[Endpoint]
DIRECT, builtin, freedom, domainStrategy=UseIP
REJECT, builtin, blackhole
Dns-Out, builtin, dns

[Routing]
domainStrategy = IPIfNonMatch

[Dns]
hijack = Dns-Out
clientIp = 114.114.114.114

[DnsServer]
localhost
223.5.5.5
8.8.8.8, 53, Remote
8.8.4.4

[DnsRule]
DOMAIN-KEYWORD, geosite:geolocation-!cn, Remote
DOMAIN-SUFFIX, google.com, Remote

[DnsHost]
doubleclick.net = 127.0.0.1

[Log]
loglevel = warning

{% endif %}
{% if request.target == "surfboard" %}

[General]
loglevel = notify
interface = 127.0.0.1
skip-proxy = 127.0.0.1, 192.168.0.0/16, 10.0.0.0/8, 172.16.0.0/12, 100.64.0.0/10, localhost, *.local
ipv6 = false
dns-server = system, 223.5.5.5
exclude-simple-hostnames = true
enhanced-mode-by-rule = true
{% endif %}
{% if request.target == "sssub" %}
{
  "route": "bypass-lan-china",
  "remote_dns": "dns.google",
  "ipv6": false,
  "metered": false,
  "proxy_apps": {
    "enabled": false,
    "bypass": true,
    "android_list": [
      "com.eg.android.AlipayGphone",
      "com.wudaokou.hippo",
      "com.zhihu.android"
    ]
  },
  "udpdns": false
}

{% endif %}
