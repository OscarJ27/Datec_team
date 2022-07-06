const  {reset} = require("nodemon");
let client = require ("../../database/db");
let db = client.db("DATEC");

let controller = {
    televisorReport: function (req, res) {
        console.log("-------------");
        console.log("ENTRANDO A LA FUNCION LISTAR POR CATEGORIA");
        db.collection("televisor").aggregate([
            {$group: {_id: "$categoria", count: {$sum: 1}}}
        ]).toArray(
            (error, dataTelevisor)=>{
                if (error || !dataTelevisor){
                    return res.status(404).send({
                        message: "No se encontraron televisores"
                    });
                }else {
                    return res.status(200).send({
                        status: "success",
                        televisorReport: dataTelevisor
                    })
                }
            }
        )
    }
}

module.exports = controller;