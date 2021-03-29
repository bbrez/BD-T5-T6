import pymysql
import pprint


views = ['testeCovid', 'medicoResponsavel', 'consultasFoz', 'fichaMedica']


def getView(cursor, view_name, param=None):
    if param is None:
        cursor.execute("SELECT * FROM {}".format(view_name))
    else:
        cursor.execute('SELECT * FROM {} WHERE {} LIKE \'{}\''.format(view_name, param[0], param[1]))
    return cursor.fetchall()


if __name__ == '__main__':
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="5762",
        database="trabbd5",
        cursorclass=pymysql.cursors.DictCursor
    )

    cursor = db.cursor()

    rodando = True
    while rodando:
        print('1 - Pacientes que fizeram exame de sangue para detectar covid 19')
        print('2 - Pacientes que um determinado medico atendeu')
        print('3 - Pacientes que se consultaram em 2021 que moram em Foz do Iguaçu')
        print('4 - Ficha medica completa')
        print('0 - Sair\n')

        selecao = int(input('Selecao: '))

        if selecao == 2:
            nome = input('Nome do Medico: ')
            pprint.pprint(getView(cursor, views[selecao-1], ['nomeMedico', nome]))
        elif selecao == 0:
            rodando = False
        else:
            pprint.pprint(getView(cursor, views[selecao-1]))

        print()
        input('Pressione [Enter] para continuar...')

    cursor.close()