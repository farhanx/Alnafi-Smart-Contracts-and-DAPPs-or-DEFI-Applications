
const ipfs = window.KuboRpcClient.create({ host: 'localhost', port: 5001 })

console.log("IPFS Object: "+ipfs);


async function test_add() {

    let cid;
    
    await ipfs.add('Hello world!').then(result=>{
        cid = result;
        console.log(cid);
        console.log(cid.path);

    })

    test_get(cid.path);

}



function uint8ArrayToAsciiString(uint8Array) {
    let asciiString = "";
    for (let i = 0; i < uint8Array.length; i++) {
      asciiString += String.fromCharCode(uint8Array[i]);
    }
    return asciiString;
}


async function test_get(_cid) {

    let content =[];

    console.log(_cid);

    for await (const chunk of ipfs.cat(_cid)) {
        content = [...content,...chunk];
    }

     console.log(uint8ArrayToAsciiString(content));
}