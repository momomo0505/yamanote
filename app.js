const PAYPAY = require('@paypayopa/paypayopa-sdk-node');
PAYPAY.Configure({
    clientId: process.env.API_KEY,
    clientSecret: process.env.API_SECRET,
    merchantId: process.env.MERCHANT_ID
})

const main = async () => {
    console.log("hoge")

    let payload = {
        marchantPaymentId: "",
        amount: {
            amount: 1,
            currency: 'JPY'
        },
        codeType: "ORDER_QR",
        orderDescription: "席",
        isAuthorization: false,
        redirectUrl: "https://paypay.ne.jp",
        redirectType: "WEB_LINK",
        userAgent: undefined
    }
    
    await PAYPAY.QRCodeCreate(payload, (response) => {
        console.log(response.BODY.resultInfo.code);
    })    
}

main()
