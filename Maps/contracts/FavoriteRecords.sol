// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.18;

/**
 * @title FavoriteRecords
 * @dev Experiment with sol map datatype
 * 
 */
 contract FavoriteRecords {
     mapping(string => bool) public approvedRecords;
     string[] approvedSet;
     mapping(address => mapping(string => bool)) userFavorites;
     mapping(address => string[]) userFavoritesSets;

     constructor() {
         approvedSet = [
                "Thriller", 
                "Back in Black",
                "The Bodyguard",
                "The Dark Side of the Moon",
                "Their Greatest Hits (1971-1975)",
                "Hotel California",
                "Come On Over",
                "Rumours",
                "Saturday Night Fever"
            ];   
         for (uint i = 0; i<approvedSet.length; i++) 
         {
             approvedRecords[approvedSet[i]] = true;
         }
     }

     function getApprovedRecords() public view returns (string[] memory) {
         return approvedSet;
     }

     
     error NotApproved(string _album);
     error AlreadyFavorite(string _album);

     function addRecord(string memory _album) public {
         if(approvedRecords[_album] == false) {
             revert NotApproved(_album);
         }
         if(userFavorites[msg.sender][_album]) {
             revert AlreadyFavorite(_album);
         }
        userFavorites[msg.sender][_album] = true;
        userFavoritesSets[msg.sender].push(_album);
     }

     function getUserFavorites(address _address) public view returns (string[] memory) {
         return userFavoritesSets[_address];
     }

     function resetUserFavorites() public {
         for (uint i = 0; i<userFavoritesSets[msg.sender].length; i++) 
         {
            userFavorites[msg.sender][userFavoritesSets[msg.sender][i]] = false;
         }
         delete userFavoritesSets[msg.sender];
     }
 }