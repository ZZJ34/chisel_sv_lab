package src_agnent_objects;

    class src_randomgen_datapkg;
        logic [7:0] data;
    endclass

    class datapkg_random;
        rand bit [7:0] data;
    endclass

    class src_generator;  

        // BUILD
        // ---------------------------------------------------           
        mailbox #(src_randomgen_datapkg) gen2drv;

        function new(
            mailbox #(src_randomgen_datapkg) gen2drv
        );
            this. gen2drv = gen2drv;
        endfunction

        // FUN : generate a random data for transport
        // ---------------------------------------------------   
        task data_gen();
            
            src_randomgen_datapkg tran_data;
            datapkg_random        random_data;

            tran_data   = new();
            random_data = new();

            void'(random_data.randomize());
            $display("[SRC_AGENT] random data generated : %d !", random_data.data );

            tran_data.data = random_data.data;
            gen2drv.put(tran_data);

        endtask        

    endclass



    class src_driver;  

        local virtual duttb_intf_sourcechannel.TBconnect active_channel;     

        // CONNECT
        // ---------------------------------------------------
        function void set_interface(
            virtual duttb_intf_sourcechannel.TBconnect sch
        );   
            this.active_channel = sch;
            
            // port initialization
            this.active_channel.channel_valid = 0;

        endfunction   

        // FUN : priority config
        // ---------------------------------------------------       
        task priority_config(
            input logic [7:0] p_val
        );
            @(posedge active_channel.clk);
            this.active_channel.channel_priority = p_val; 
        endtask

        // FUN : data write
        // ---------------------------------------------------
        // this function is to realize the data transport by
        // handshake 
        task data_write(
            input logic [7:0] data
        );
            
            // valid
            @(posedge active_channel.clk); 
            this.active_channel.channel_valid = 1;
            this.active_channel.channel_data  = data;

            #1; // <------------------------------------------ first check point

            // immediate assert
            if(active_channel.channel_ready == 1) begin
                // next cycle reset all
                @(posedge active_channel.clk); 
            end else begin
                // hold and waiting for ready
                for (int i=0;i<10;i++) begin
                    @(posedge active_channel.clk);  
                    #1;
                    if(active_channel.channel_ready == 1) begin
                        i = 10;
                        @(posedge active_channel.clk); 
                    end else begin
                        i = 1;
                    end       
                end
            end                     
    
            // now the ready is received, drive the signal when next clk posedge
            this.active_channel.channel_valid = 0;
            this.active_channel.channel_data  = 0;   

        endtask

        // FUN : data write double
        // ---------------------------------------------------
        task data_write_double(
            input logic [7:0] dataA,
            input logic [7:0] dataB
        );
            // write dataA
            // -----------------------------------------------
            // valid
            @(posedge active_channel.clk); 
            this.active_channel.channel_valid = 1;
            this.active_channel.channel_data  = dataA;

            #1;

            // immediate assert
            if(active_channel.channel_ready == 1) begin
                // next cycle reset all
                @(posedge active_channel.clk); 
            end else begin
                // hold and waiting for ready
                for (int i=0;i<10;i++) begin
                    @(posedge active_channel.clk);  
                    if(active_channel.channel_ready == 1) begin
                        i = 10;
                        @(posedge active_channel.clk); 
                    end else begin
                        i = 1;
                    end       
                end
            end  

            // write dataB
            // -----------------------------------------------
            // hold valid and change data
            this.active_channel.channel_data  = dataB;

            #1;

            // immediate assert
            if(active_channel.channel_ready == 1) begin
                // next cycle reset all
                @(posedge active_channel.clk); 
            end else begin
                // hold and waiting for ready
                for (int i=0;i<10;i++) begin
                    @(posedge active_channel.clk);  
                    if(active_channel.channel_ready == 1) begin
                        i = 10;
                        @(posedge active_channel.clk); 
                    end else begin
                        i = 1;
                    end       
                end
            end  

            // now the ready is received, drive the signal when next clk posedge
            this.active_channel.channel_valid = 0;
            this.active_channel.channel_data  = 0;       
            
        endtask
    endclass

endpackage



package src_agent_main;
    
    import src_agnent_objects ::*;

    class src_agent;

        // BUILD
        // ---------------------------------------------------        
        src_generator                    src_generator;
        mailbox #(src_randomgen_datapkg) mailbox_gen2drv;
        src_driver                       src_driver0;
        src_driver                       src_driver1;
        src_driver                       src_driver2;
        src_driver                       src_driver3;
        src_driver                       src_driver4;
        src_driver                       src_driver5;
        src_driver                       src_driver6;
        src_driver                       src_driver7;

        function new();
            this.mailbox_gen2drv = new(16);
            this.src_generator   = new(mailbox_gen2drv);
            this.src_driver0     = new();
            this.src_driver1     = new();
            this.src_driver2     = new();
            this.src_driver3     = new();
            this.src_driver4     = new();
            this.src_driver5     = new();
            this.src_driver6     = new();
            this.src_driver7     = new();
        endfunction

        // CONNECT
        // ---------------------------------------------------
        function void set_interface(
            virtual duttb_intf_sourcechannel.TBconnect sch_0,
            virtual duttb_intf_sourcechannel.TBconnect sch_1, 
            virtual duttb_intf_sourcechannel.TBconnect sch_2, 
            virtual duttb_intf_sourcechannel.TBconnect sch_3, 
            virtual duttb_intf_sourcechannel.TBconnect sch_4, 
            virtual duttb_intf_sourcechannel.TBconnect sch_5, 
            virtual duttb_intf_sourcechannel.TBconnect sch_6, 
            virtual duttb_intf_sourcechannel.TBconnect sch_7
        );   
            // connect to src_driver
            this.src_driver0.set_interface(sch_0);
            this.src_driver1.set_interface(sch_1);
            this.src_driver2.set_interface(sch_2);
            this.src_driver3.set_interface(sch_3);
            this.src_driver4.set_interface(sch_4);
            this.src_driver5.set_interface(sch_5);
            this.src_driver6.set_interface(sch_6);
            this.src_driver7.set_interface(sch_7);
        endfunction         

        // FUN : priority config
        // ---------------------------------------------------
        // this function is to ask the drivers to assign the priority            
        task priority_config(
            input logic [7:0] p_val_0,
            input logic [7:0] p_val_1,
            input logic [7:0] p_val_2,
            input logic [7:0] p_val_3,
            input logic [7:0] p_val_4,
            input logic [7:0] p_val_5,
            input logic [7:0] p_val_6,
            input logic [7:0] p_val_7
        );
            this.src_driver0.priority_config(p_val_0);
            this.src_driver1.priority_config(p_val_1);
            this.src_driver2.priority_config(p_val_2);
            this.src_driver3.priority_config(p_val_3);
            this.src_driver4.priority_config(p_val_4);
            this.src_driver5.priority_config(p_val_5);
            this.src_driver6.priority_config(p_val_6);
            this.src_driver7.priority_config(p_val_7);
        endtask

        // FUN : single data tran
        // ---------------------------------------------------          
        task single_tran(
            input int         select_num, // choose which channel to transport
            input bit         gen       , // if need generator to gen a data
            input logic [7:0] user_data   // if don't need give your data here
        );

            // first generate a data to transport if need
            logic [7:0] local_data;
            src_randomgen_datapkg random_data_get;

            if(gen) begin
                this.src_generator.data_gen();
                this.mailbox_gen2drv.get(random_data_get);
                local_data = random_data_get.data;
                $display("[SRC_AGENT] random data get : %d !", local_data );
            end else begin
                local_data = user_data;
            end

            // select and ask the driver to write the data
            case(select_num)
                0: begin src_driver0.data_write(local_data); end 
                1: begin src_driver1.data_write(local_data); end 
                2: begin src_driver2.data_write(local_data); end 
                3: begin src_driver3.data_write(local_data); end 
                4: begin src_driver4.data_write(local_data); end 
                5: begin src_driver5.data_write(local_data); end 
                6: begin src_driver6.data_write(local_data); end 
                7: begin src_driver7.data_write(local_data); end 
                default: begin
                    $display("[SRC_AGENT] select error, out of range with %d !", select_num);
                end
            endcase

        endtask


        // FUN : double data tran
        // ---------------------------------------------------          
        task double_tran(
            input int         select_num
        );

            // first generate a data to transport if need
            logic [7:0] local_dataA;
            logic [7:0] local_dataB;
            src_randomgen_datapkg random_data_get;



            // generate A
            this.src_generator.data_gen();
            this.mailbox_gen2drv.get(random_data_get);
            local_dataA = random_data_get.data;
            $display("[SRC_AGENT] random data get : %d !", local_dataA );

            // generate B
            this.src_generator.data_gen();
            this.mailbox_gen2drv.get(random_data_get);
            local_dataB = random_data_get.data;
            $display("[SRC_AGENT] random data get : %d !", local_dataA );



            // select and ask the driver to write the data
            case(select_num)
                0: begin src_driver0.data_write_double(local_dataA,local_dataB); end 
                1: begin src_driver1.data_write_double(local_dataA,local_dataB); end 
                2: begin src_driver2.data_write_double(local_dataA,local_dataB); end 
                3: begin src_driver3.data_write_double(local_dataA,local_dataB); end 
                4: begin src_driver4.data_write_double(local_dataA,local_dataB); end 
                5: begin src_driver5.data_write_double(local_dataA,local_dataB); end 
                6: begin src_driver6.data_write_double(local_dataA,local_dataB); end 
                7: begin src_driver7.data_write_double(local_dataA,local_dataB); end 
                default: begin
                    $display("[SRC_AGENT] select error, out of range with %d !", select_num);
                end
            endcase

        endtask
    endclass

endpackage
