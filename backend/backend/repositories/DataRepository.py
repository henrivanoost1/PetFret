from .Database import Database


class DataRepository:
    @staticmethod
    def json_or_formdata(request):
        if request.content_type == 'application/json':
            gegevens = request.get_json()
        else:
            gegevens = request.form.to_dict()
        return gegevens

    @staticmethod
    def read_waarde_beweging():
        # max_id = Database.get_one_row("SELECT max(idMeting) from Meting")
        # sql = f"SELECT waarde from Meting where id={max_id}"
        sql = "SELECT waarde FROM Meting ORDER BY idMeting DESC LIMIT 1"
        return Database.get_one_row(sql)

    @staticmethod
    def read_waarde_temp():
        # max_id = Database.get_one_row("SELECT max(idMeting) from Meting")
        # sql = f"SELECT waarde from Meting where id={max_id}"
        sql = "SELECT waarde FROM Meting where Sensor_idSensor=2 ORDER BY idMeting DESC LIMIT 1"
        return Database.get_one_row(sql)

    @staticmethod
    def read_status_lamp_by_id(id):
        sql = "SELECT * from lampen WHERE id = %s"
        params = [id]
        return Database.get_one_row(sql, params)

    @staticmethod
    def read_data_chart():
        sql = "SELECT count(idMeting) as 'hoeveel', concat(DATE_FORMAT(timestamp,'%a'),' ',concat(day(timestamp),'/',month(timestamp),'/',year(timestamp))) as 'dag' FROM PetFret.Meting where Sensor_idSensor=1 and Meting.timestamp >= date(now()) - interval 6 day group by date(timestamp) order by timestamp asc;"
        return Database.get_rows(sql)

    @staticmethod
    def update_status_lamp(id, status):
        sql = "UPDATE Meting SET status = %s WHERE id = %s"
        params = [status, id]
        return Database.execute_sql(sql, params)

    @staticmethod
    def update_status_alle_lampen(status):
        sql = "UPDATE lampen SET status = %s"
        params = [status]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_nieuwe_meting_beweging(waarde, eenheid, timestamp, Sensor_idSensor):
        sql = "INSERT INTO `Meting`(waarde, meeteenheid, timestamp, Sensor_idSensor) VALUES (%s, %s, %s, %s);"
        params = [waarde, eenheid, timestamp, Sensor_idSensor]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_nieuwe_meting_waterniveau(waarde, eenheid, timestamp, Sensor_idSensor):
        sql = "INSERT INTO `Meting`(waarde, meeteenheid, timestamp, Sensor_idSensor) VALUES (%s, %s, %s, %s);"
        params = [waarde, eenheid, timestamp, Sensor_idSensor]
        return Database.execute_sql(sql, params)

    @staticmethod
    def create_nieuwe_meting_voedingsbak_id(waarde, eenheid, timestamp, Sensor_idSensor, Voedingsbak_id):
        sql = "INSERT INTO `Meting`(waarde, meeteenheid, timestamp, Sensor_idSensor, Voedingsbak_idVoedingsbak) VALUES (%s, %s, %s, %s, %s);"
        params = [waarde, eenheid, timestamp, Sensor_idSensor, Voedingsbak_id]
        return Database.execute_sql(sql, params)
