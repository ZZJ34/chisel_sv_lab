package env;

    import src_agent_main ::*;
    import dst_agent ::*;  

    class env_ctrl;

        // BUILD
        // ---------------------------------------------------
        // the new function is to give the class object a name
        // and build its subordinates

        // first declare your subordinates
        src_agent src_agent;
        dst_agent dst_agent;

        // new them
        function new();
            this.src_agent  = new();
            this.dst_agent  = new();
        endfunction        

        // CONNECT
        // ---------------------------------------------------
        // the set_interface function is to connect the interface to itself
        // and then also connect to its subordinates
        // (only if used)
        function void set_interface(
            virtual duttb_intf_sourcechannel.TBconnect      sch_0,
            virtual duttb_intf_sourcechannel.TBconnect      sch_1, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_2, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_3, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_4, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_5, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_6, 
            virtual duttb_intf_sourcechannel.TBconnect      sch_7, 
            virtual duttb_intf_destinationchannel.TBconnect dch
        );

            // connect to src_agent
            this.src_agent.set_interface(
                sch_0,
                sch_1,
                sch_2,
                sch_3,
                sch_4,
                sch_5,
                sch_6,
                sch_7           
            );

            // connect to dst_agnet
            this.dst_agent.set_interface(
                dch          
            );
            
        endfunction 

        // RUN
        // ---------------------------------------------------
        // manage your work here : 
        // (1) receive the command from the testbench
        // (2) call its subordinates to work
        task run(string state);
            case(state)
                "Config_Priority_01234567": begin
                    $display("[ENV] start work : Config_Priority !");
                    this.src_agent.priority_config(0,1,2,3,4,5,6,7);
                end
                "Config_Priority_76543210": begin
                    $display("[ENV] start work : Config_Priority !");
                    this.src_agent.priority_config(0,0,0,0,0,0,0,0);
                end
                "Start_Source_Agent": begin
                    $display("[ENV] start work : Start_Source_Agent !");
                    this.src_agent.single_tran(7,0,1);
                    this.src_agent.single_tran(0,1,2);
                    fork
                        this.src_agent.single_tran(2,1,324);
                        this.src_agent.single_tran(3,0,23);
                    join
                end
                "Start_Source_Agent_Plus": begin
                    $display("[ENV] start work : Start_Source_Agent_Plus !");
                    fork
                        this.src_agent.double_tran(0);
                        this.src_agent.double_tran(1);
                        this.src_agent.double_tran(2);
                        this.src_agent.double_tran(3);
                        this.src_agent.double_tran(4);
                        this.src_agent.double_tran(5);
                        this.src_agent.double_tran(6);
                        this.src_agent.double_tran(7);
                    join
                end
                "Start_Destination_Agent": begin
                    $display("[ENV] start work : Start_Destination_Agent !");
                    for (int i=0;i<25;i++) begin
                        this.dst_agent.single_get();
                    end
                end
                "Start_Destination_Agent_always": begin
                    $display("[ENV] start work : Start_Destination_Agent !");
                    this.dst_agent.always_get(25);
                end
                "Time_Run": begin
                    $display("[ENV] start work : Time_Run !");
                    #10000000
                    $display("[ENV] time out !");
                end
                default: begin
                end
            endcase
        endtask

    endclass

endpackage