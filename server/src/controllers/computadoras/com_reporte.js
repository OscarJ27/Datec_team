const  {reset} = require("nodemon");
let client = require ("../../database/db");
let db = client.db("Datec");

let controller = {
    productosReport: function (req, res) {
        console.log("-------------");
        console.log("ENTRANDO A LA FUNCION LISTAR POR CATEGORIA");
        db.collection("Computadoras").aggregate([
            {$group: {_id: "$categoria", count: {$sum: 1}}}
        ]).toArray(
            (error, dataProductos)=>{
                if (error || !dataProductos){
                    return res.status(404).send({
                        message: "No se encontraron productos"
                    });
                }else {
                    return res.status(200).send({
                        status: "success",
                        productosReport: dataProductos
                    })
                }
            }
        )
    }
}

module.exports = controller;