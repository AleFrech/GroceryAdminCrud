component output="false"{

    remote function logout(){
        structDelete(session,"User");
        location("../Index.cfm");
    }
}