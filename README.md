# telegram-proxy
[![CircleCI](https://circleci.com/gh/MichaelPak/telegram-proxy.svg?style=svg&circle-token=3684543621903ba626a15384f74be26b10100b3b)](https://circleci.com/gh/MichaelPak/telegram-proxy)
В связи с [последними новостями] блокировки Telegram РосКомНадзором, появилась необходимость в создании proxy-сервера.

## Интродакшн
Из коробки Telegram поддерживает протокол [SOCKS5]. Поэтому в качестве прокси будем использовать SOCKS сервер [Dante]. Для удобства сервер обернут в Docker образ на базе [Alpine].

## Реквайрементс
Для своего собственного proxy-сервера нам понадобятся:

  - Банковская карта, на которой будет 5$ в месяц;
  - Аккаунт на [DigitalOcean] (DO);
  - Возможность подключаться к серверам по SSH.

## Инсталл & Сетап

  1. Берем дроплет на DO за 5$ с предустановленным Docker.
  2. Открываем нужный порт в фаерволе:
  ```sh
  $ ufw allow 1080
  ```
  3. Запускаем proxy-сервер, заменяя `USERNAME` и `PASSWORD` и лог/пасс:
  ```sh
  $ docker run -p 1080:1080 -e "USER={USERNAME}" -e "PASSWD={PASSWORD}" -d  michaelpak/telegram-proxy
  ```
  4. Прописываем данные нашего proxy-сервера в Telegram, где `server` - IP адрес нашего сервера, `port` - `1080`, `login` и `password` те, которые были указаны при запуске.
  5. Profit!

   [последними новостями]: <https://rkn.gov.ru/news/rsoc/news56802.htm>
   [SOCKS5]: <https://en.wikipedia.org/wiki/SOCKS>
   [Dante]: <https://www.inet.no/dante/>
   [Alpine]: <https://alpinelinux.org/>
   [DigitalOcean]: <https://www.digitalocean.com/>
