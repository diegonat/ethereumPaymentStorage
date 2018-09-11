pragma solidity ^0.4.0;

contract PaymentStorage {

    struct Transaction {
        uint euro; // money transferred
        string sender; // money sender
        string receiver; // money receiver
    }    


    mapping (address => Transaction) transactions;
    address[] public transactionsAddress;

    
    function saveTransaction (uint euro, string sender, string receiver) {
      transactions[msg.sender].euro = euro;
      transactions[msg.sender].sender = sender;
      transactions[msg.sender].sender = receiver;
    
      // push user address into transactionAddresses array
      transactionsAddress.push(msg.sender);
    }

    function getAllTransactions() external view returns (address[]) {
      return transactionsAddress;
    }    
    

    function getPaymentHistory(address transactionAddr) constant
        returns (uint euro, string sender, string receiver) {

        Transaction storage tns = transactions[transactionAddr];

        return (tns.euro, tns.sender, tns.receiver);
    }      
    
}
