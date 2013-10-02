import sys
import MySQLdb

# https://github.com/aaronsw/html2text
import html2text

h = html2text.HTML2Text()
db = MySQLdb.connect(host="localhost", user="dg_dev", passwd="er1nb3rmud3z", db="damiangalarza_development")

cursor = db.cursor()
cursor.execute("SELECT id, comment FROM comments")
for row in cursor.fetchall() :
  update_c = db.cursor()
  try:
    clean = html2text.html2text(row[1])
    print row[0]
    print clean
    update_c.execute("""UPDATE comments SET comment = %s WHERE id = %s""", (clean, row[0]))
  except:
    pass
  #update_c.execute('UPDATE comments SET comment = %s WHERE id = %s', (updated_str, row[0]))

db.commit()
sys.exit()
