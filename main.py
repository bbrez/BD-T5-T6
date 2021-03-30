import pymysql
import pprint


views = ['testeCovid', 'medicoResponsavel', 'consultasFoz', 'fichaMedica']


def getView(cursor, view_name, conditional=None):
    if conditional is None:
        cursor.execute("SELECT * FROM {}".format(view_name))
    else:
        cursor.execute('SELECT * FROM {} {}'.format(view_name, conditional))
    return cursor.fetchall()


if __name__ == '__main__':
    db = pymysql.connect(
        host="localhost",
        user="root",
        password="geladeira0",
        database="trabbd5",
        cursorclass=pymysql.cursors.DictCursor
    )

    cursor = db.cursor()

    rodando = True
    while rodando:
        print('1 - Pacientes que fizeram exame de sangue para detectar COVID-19')
        print('2 - Pacientes que um determinado medico atendeu')
        print('3 - Pacientes que se consultaram em 2021 que moram em Foz do Iguaçu')
        print('4 - Ficha medica completa')
        print('0 - Sair\n')

        selecao = int(input('Selecao: '))

        if selecao == 1:
            pprint.pprint(getView(cursor, views[selecao-1], 'WHERE nomeTipoExame LIKE \'Teste de sangue - COVID-19\''), sort_dicts=False)

        elif selecao == 2:
            nome = '%'+input('Nome do Medico: ')+'%'
            pprint.pprint(getView(cursor, views[selecao-1], 'WHERE nomeMedico LIKE \'{}\''.format(nome)), sort_dicts=False)

        elif selecao == 3:
            pprint.pprint(getView(cursor, views[selecao-1], 'WHERE nomeCidade LIKE \'Foz do Iguaçu\' AND EXTRACT(YEAR FROM dataConsulta) LIKE \'2021\''), sort_dicts=False)

        elif selecao == 4:
            pprint.pprint(getView(cursor, views[selecao-1]), width=120, sort_dicts=False)

        elif selecao == 0:
            rodando = False
            
        else:
            pprint.pprint(getView(cursor, views[selecao-1]))

        print()
        input('Pressione [Enter] para continuar...')

    cursor.close()