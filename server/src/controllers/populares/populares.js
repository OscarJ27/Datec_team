const client = require("../../database/db"),
    db = client.db('DATEC');

let controller = {

    //Listar
    list: function (req, res) {
        console.log('-----------------------------');
        console.log('ENTRANDO A LA FUNCION LISTAR');
        db.collection("Populares").find().toArray(
            (error, dataProductos) => {
                if (error || !dataProductos) {
                    return res.status(404).send({
                        message: "No se ha encontrado los productos"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        popular: dataProductos
                    });
                }
            }
        );
    },
    // Buscar
    find: function (req, res) {
        console.log('-----------------------------');
        console.log('ENTRANDO A LA FUNCION BUSCAR');
        db.collection("Populares").find({productoId: parseInt(req.params.id)}).toArray(
            (error, dataProductos) => {
                if (error || !dataProductos) {
                    return res.status(404).send({
                        message: "No se encontro el producto"
                    });
                } else {
                    return res.status(200).send({
                        status: "success",
                        popular: dataProductos[0]
                    });
                }
            }
        );
    },
    // Guardar
    save: function (req, res) {
        console.log('-----------------------------');
        console.log('ENTRANDO A LA FUNCION SAVE');
        console.log(req.body);
        if (req.body.productoId == "0") {
            db.collection("Populares").estimatedDocumentCount().then(
                countProductos => {
                    let producto = {}
                    producto.productoId = countProductos + 1;
                    producto.descripcion = req.body.descripcion;
                    producto.precio = req.body.precio;
                    producto.imagen = req.body.imagen;

                    db.collection("Populares").insertOne(
                        producto, (error, result) => {
                            if (error) {
                                return res.status(404).send({
                                    message: "No se pudo registrar el producto"
                                });
                            } else {
                                return res.status(200).send({
                                    status: "succes",
                                    popular: result
                                });
                            }
                        }
                    )
                }
            )
        } else {
            console.log('ENTRANDO A EDITAR');
            let producto = {}
            producto.productoId = parseInt(req.body.productoId);
            producto.descripcion = req.body.descripcion;
            producto.precio = req.body.precio;
            producto.imagen = req.body.imagen;
            console.log(producto);
            db.collection("Populares").updateOne({productoId: {$eq: parseInt(req.body.productoId)}},
                {$set: producto},
                (error, result) =>{
                    if (error){
                        return res.status(404).send({
                            message: "No se pudo editar el producto"
                        });
                    }else {
                        return res.status(200).send({
                            status: "success",
                            popular: result
                        });
                    }
                }
            )

        }
    }
}

module.exports = controller;