pragma solidity ^0.4.11;

// Distense is a decentralized, for-profit code cooperative
// INSECURE/DRAFT

import './lib/SafeMath.sol';

contract Tasks {
  using SafeMath for uint256;

  uint256 public numTasks;
  uint256 public numContribs;

  address  public votingAddress;

  struct Task {
    address createdBy;
    string  title;
    string  url;
    string project;
    string subProject;
    bytes ipfsHashID; // longer than 32
    uint256 createdAt;
    TaskStatus status;
  }

<<<<<<< Updated upstream
  mapping (bytes32 => Task) tasksMap;
=======
  mapping (bytes => Task) tasksMap;
>>>>>>> Stashed changes
  Task[] public tasksList;

  enum TaskStatus { Proposal, Task, Contribution }
  event TaskCreated(address indexed purchaser, string indexed title, string url);

  // INSECURE/DRAFT
  function Tasks () {
    numTasks = 0;
    numContribs = 0;
  }

<<<<<<< Updated upstream
  function createTask(bytes32 _title, string _url, string _project, bytes32 _ipfsHashID) external returns (bool) {
    Task memory task = Task(msg.sender, _title, _url, _project, _ipfsHashID, block.timestamp, TaskStatus.Proposal);
=======
  function createTask(string _title, string _url, string _project, string _subProject, bytes _ipfsHashID) external returns (bool) {
    Task memory task = Task(msg.sender, _title, _url, _project, _subProject, _ipfsHashID, block.timestamp, TaskStatus.Proposal);
>>>>>>> Stashed changes
    tasksMap[_ipfsHashID] = task;
    tasksList.push(task);
    TaskCreated(msg.sender, _title, _url);
    return true;
  }

  function getTasksLength() public constant returns(uint) {
    return tasksList.length;
  }

<<<<<<< Updated upstream
  function getTaskFromMapping(bytes32 ipfsHashID) public constant returns (address, bytes32, bytes32, bytes32, uint256, TaskStatus) {
    return (tasksMap[ipfsHashID].createdBy, tasksMap[ipfsHashID].title, tasksMap[ipfsHashID].url, tasksMap[ipfsHashID].project, tasksMap[ipfsHashID].createdAt, tasksMap[ipfsHashID].status);
  }

  function getTaskFromList(uint256 ind) public constant returns (address, bytes32, bytes32, bytes32, uint256, TaskStatus) {
    return (tasksList[ind].createdBy, tasksList[ind].title, tasksList[ind].url, tasksList[ind].project, tasksList[ind].createdAt, tasksList[ind].status);
=======
  function getTaskFromMapping(bytes ipfsHashID) public constant returns (
    address,
    string,
    string,
    string,
    string,
    uint256,
    TaskStatus
  ) {
    return (
    tasksMap[ipfsHashID].createdBy,
    tasksMap[ipfsHashID].title,
    tasksMap[ipfsHashID].url,
    tasksMap[ipfsHashID].project,
    tasksMap[ipfsHashID].subProject,
    tasksMap[ipfsHashID].createdAt,
    tasksMap[ipfsHashID].status
    );
  }

  function getTaskFromList(uint256 ind) public constant returns (
  address,
  string,
  string,
  string,
  string,
  uint256,
  TaskStatus
  ) {
    return (
    tasksList[ind].createdBy,
    tasksList[ind].title,
    tasksList[ind].url,
    tasksList[ind].project,
    tasksList[ind].subProject,
    tasksList[ind].createdAt,
    tasksList[ind].status
    );
  }

  function getTaskByID(bytes ipfsHash) public constant returns (
    address,
    string,
    string,
    string,
    string,
    uint256,
    TaskStatus
  ) {
    return (
    tasksMap[ipfsHash].createdBy,
    tasksMap[ipfsHash].title,
    tasksMap[ipfsHash].url,
    tasksMap[ipfsHash].project,
    tasksMap[ipfsHash].subProject,
    tasksMap[ipfsHash].createdAt,
    tasksMap[ipfsHash].status);
>>>>>>> Stashed changes
  }

  modifier onlyVoting () {
    require(msg.sender == votingAddress);
    _;
  }

}
