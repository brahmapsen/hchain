module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
networks: {
    prod: {
      host: "localhost",
      port: 9545,
      network_id: "*" // Match any network id
    }
  },
rpc:{
host:"localhost",
port:9545
}
};
