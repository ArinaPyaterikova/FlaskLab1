# Программа на Python для создания блокчейна
import datetime # Для временной метки
import hashlib # Вычисление хэша для добавления цифровой подписи к блокам
import json # Для хранения данных в блокчейне
# Flask предназначен для создания веб-приложения, а jsonify - для
# отображения блокчейна
from flask import Flask, jsonify
from os import environ # Для использования env переменных (в ОС)
import psycopg2 # Для подключения к бд postgres
import pandas as pd
class Blockchain:
# Эта функция ниже создана для создания самого первого блока и установки его хэша равным "0"
    def __init__(self):
        self.chain = []
        self.create_block(proof=1, previous_hash='0')
# Эта функция ниже создана для добавления дополнительных блоков в цепочку
    def propertyDb():
        dbUrl = environ.get('DB_URL')
        dbUser = environ.get('DB_USER')
        dbPassword = environ.get('DB_PASSWORD')
        dbHost = environ.get('DB_HOST')
        conn = psycopg2.connect(dbname=dbUrl, user=dbUser, password=dbPassword, host=dbHost)
        cursor = conn.cursor()
        cursor.execute('SELECT * FROM "costume_tb"')
        df = cursor.fetchall()
        df = pd.DataFrame(df)
        print(df)
        print(df[0].iloc[0], "transaction_id")
        print(df[0].iloc[0], "id")
        print(df[0].iloc[0], "lease_date")
        print(df[1].iloc[0], "recv")
        print(df[2].iloc[0], "event_addres")
        print(df[4].iloc[0], "costume_name")
        print(df[5].iloc[0], "condition")
        return df
    def create_block(self, proof, previous_hash):
        db = Blockchain.propertyDb()
        block = {'index': len(self.chain) + 1,
                 'timestamp': str(datetime.datetime.now()),
                 'transaction_id': str(db[0].iloc[len(self.chain)]),
                 'id': str(db[1].iloc[len(self.chain)]),
                 'lease_date': str(db[2].iloc[len(self.chain)]),
                 'recv': str(db[3].iloc[len(self.chain)]),
                 'event_addres': str(db[4].iloc[len(self.chain)]),
                 'costume_name': str(db[5].iloc[len(self.chain)]),
                 'condition': str(db[6].iloc[len(self.chain)]),
                 'proof': proof,
                 'previous_hash': previous_hash}
        self.chain.append(block)
        return block
# Эта функция ниже создана для отображения предыдущего блока
    def print_previous_block(self):
        return self.chain[-1]
# Это функция для проверки работы и используется для успешного майнинга блока
    def proof_of_work(self, previous_proof):
        new_proof = 1
        check_proof = False
        while check_proof is False:
            hash_operation = hashlib.sha256(
                str(new_proof**2 - previous_proof**2).encode()).hexdigest()
            if hash_operation[:5] == '00000':
                check_proof = True
            else:
                new_proof += 1
        return new_proof
    def hash(self, block):
        encoded_block = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(encoded_block).hexdigest()
    def chain_valid(self, chain):
        previous_block = chain[0]
        block_index = 1
        while block_index < len(chain):
            block = chain[block_index]
            if block['previous_hash'] != self.hash(previous_block): # Текущий блок поле previous_hash сравниваем с пересчитанным хешем предыдущего блока (запускаем сами пересчет)
                return False
            previous_proof = previous_block['proof'] # сохраняем из предыдущего блока поле proof
            proof = block['proof'] # сохраняем из текущего блока поле proof
            hash_operation = hashlib.sha256( # проверка на принадлеженость к цепочке текущего блока
                str(proof**2 - previous_proof**2).encode()).hexdigest()
            if hash_operation[:5] != '00000':
                return False
            previous_block = block
            block_index += 1
        return True




# Создание веб-приложения с использованием flask
app = Flask(__name__)
# Создаем объект класса blockchain
blockchain = Blockchain()
# Майнинг нового блока
@app.route('/mine_block', methods=['GET'])
def mine_block():
    previous_block = blockchain.print_previous_block() # отображение предыдущего блока
    previous_proof = previous_block['proof'] # получаем поле proof предыдущего блока
    proof = blockchain.proof_of_work(previous_proof) # создаем новый блок и проверяем его на коррекутность создания
    previous_hash = blockchain.hash(previous_block) # получаем хэш предыдущего блока только что посчитанный
    block = blockchain.create_block(proof, previous_hash) # вносим данные в новый блок
    response = {'message': 'A block is MINED', # указываем данные, которые хотим получить на странице
                'index': block['index'],
                'timestamp': block['timestamp'],
                'transaction_id': block['transaction_id'],
                'id': block['id'],
                'lease_date': block['lease_date'],
                'recv': block['recv'],
                'event_addres': block['event_addres'],
                'costume_name': block['costume_name'],
                'condition': block['condition'],
                'proof': block['proof'],
                'previous_hash': block['previous_hash']}
    return jsonify(response), 200 # переводим данные в json и возвращаем


# Отобразить блокчейн в формате json
@app.route('/get_chain', methods=['GET'])
def display_chain():
    response = {'chain': blockchain.chain,
                'length': len(blockchain.chain)}
    return jsonify(response), 200


# Проверка валидности блокчейна (всей цепочки)
@app.route('/valid', methods=['GET'])
def valid():
    valid = blockchain.chain_valid(blockchain.chain)
    if valid:
        response = {'message': 'The Blockchain is valid.'}
    else:
        response = {'message': 'The Blockchain is not valid.'}
    return jsonify(response), 200


# Запустите сервер flask локально
app.run(host='0.0.0.0', port=4000)