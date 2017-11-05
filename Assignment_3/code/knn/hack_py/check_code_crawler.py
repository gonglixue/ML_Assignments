
# coding: utf-8

# In[24]:

from bs4 import BeautifulSoup
import requests
import urllib
import urllib2

jw_url = 'http://jwbinfosys.zju.edu.cn/default2.aspx';
jw_url_prefix = 'http://jwbinfosys.zju.edu.cn/';
N = 300;

def SaveCheckCodeImage(file_name):
    
    html = requests.get(jw_url).content;
    soup = BeautifulSoup(html, 'html.parser', from_encoding='utf-8');
    result = soup('img');
    check_code_node = result[0];
    check_code_url = check_code_node.get('src');

    urllib.urlretrieve(jw_url_prefix+check_code_url, file_name);
    print("save image in %s"%file_name);


# In[25]:

for i in range(0, N):
    file_name = "./source_image/img_" + str(i) + ".jpg";
    SaveCheckCodeImage(file_name);

