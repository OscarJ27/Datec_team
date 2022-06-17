const req = require("express/lib/request");
let client = require("../../database/db");
let db = client.db("OscarDB");

let controller = {
    //LISTAR
    list: function (req, res) {
        console.log("------------");
        console.log("ENTRANDO A LA FUNCION LISTAR");
        db.collection("pagos").find().toArray(
            (error, dataMetodos) => {
                if (error || !dataMetodos) {
                    console.log(error);
                    return res.status(404).send({
                        message: "No se encontraron los metodos"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        metodos: dataMetodos
                    });
                }
            }
        );
    },

    find: function (req, res) {
        console.log("-------------");
        console.log("ENTRANDO A LA FUNCION FIND");
        console.log("id:" + req.params.id);
        db.collection("pagos").find({ metodoId: parseInt(req.params.id) }).toArray(
            (error, dataMetodos) => {
                if (error || !dataMetodos) {
                    return res.status(404).send({
                        message: "No se encontro el metodo "
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        metodos: dataMetodos[0]
                    });
                }
            }
        )
    },

    save: function (req, res) {
        console.log("-------------");
        console.log("ENTRANDO A LA FUNCION SAVE");
        console.log(req.body);
        if (req.body.metodoId == "0") {
            console.log("ENTRANDO A NUEVO");
            db.collection("pagos").count().then(
                countMetodos => {
                    var metodo = {}
                    metodo.metodoId = countMetodos + 1;
                    metodo.cvv = req.body.cvv;
                    metodo.nombApellido = req.body.nombApellido;
                    metodo.tarjeta = req.body.tarjeta;
                    metodo.vencimiento = req.body.vencimiento;
                    db.collection('pagos').insertOne(metodo,
                        (error, result) => {
                            if (error) {
                                return res.status(404).send({
                                    message: " No se pudo registrar el metodo"
                                });
                            } else {
                                return res.status(200).send({
                                    message: "success",
                                    metodo: result
                                });
                            }
                        });

                }
            )
        } else {
            console.log("ENTRANDO A EDITAR");
            var metodo = {}
            metodo.metodoId = parseInt(req.body.metodoId);
            metodo.cvv = req.body.cvv;
            metodo.nombApellido = req.body.nombApellido;
            metodo.tarjeta = req.body.tarjeta;
            metodo.vencimiento = req.body.vencimiento;
            console.log(metodo);
            db.collection("pagos").updateOne({ metodoId: { $eq: parseInt(req.body.metodoId) } },
                { $set: metodo },
                (error, result) => {
                    if (error) {
                        return res.status(404).send({
                            message: " No se pudo editar el metodo"
                        });
                    } else {
                        return res.status(200).send({
                            message: "success",
                            metodo: result
                        });
                    }
                }
            );
        }
    }

}
module.exports = controller;