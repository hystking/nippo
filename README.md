# 日報をMarkdownで書くシェルスクリプト

```
npm start
```

で日報を書く

```
npm run show
```

で日報を見る

---

alias 貼ると便利

```
function _nippo()
{
  TEMP_CURRENT_DIR=`pwd`
  cd /path/to/nippo/
  if [ "$1" = show ]; then
    npm run show
  else
    npm start
  fi
  cd $TEMP_CURRENT_DIR
}

alias nippo=_nippo
```
