package dst_agnent_objects;

    class dst_driver;  

        local virtual duttb_intf_destinationchannel.TBconnect active_channel;     

        // CONNECT
        // ---------------------------------------------------
        function void set_interface(
            virtual duttb_intf_destinationchannel.TBconnect dch
        );   
            this.active_channel = dch;
            
            // port initialization
            this.active_channel.channel_valid = 0;

        endfunction   

        // FUN : fifo data get
        // ---------------------------------------------------
        // this function is to realize the data transport by
        // handshake 
        task fifo_data_get(
            output logic [2:0] data
        );
            
            // valid
            @(posedge active_channel.clk); 
            this.active_channel.channel_valid = 1;

            #1;

            // immediate assert
            if(active_channel.channel_ready == 1) begin
                data = this.active_channel.channel_data;
                // next cycle reset all
                @(posedge active_channel.clk); 
            end else begin
                // hold and waiting for ready
                for (int i=0;i<10;i++) begin
                    @(posedge active_channel.clk);  
                    if(active_channel.channel_ready == 1) begin
                        data = this.active_channel.channel_data;
                        i = 10;
                        @(posedge active_channel.clk);  
                    end else begin
                        i = 1;
                    end       
                end
            end

            // now the ready is received, drive the signal when next clk posedge    
            this.active_channel.channel_valid = 0;
                    
        endtask

        // FUN : fifo data alwaysget
        // ---------------------------------------------------
        task fifo_data_alwaysget(
            input int cycles
        );
            
            // valid
            @(posedge active_channel.clk); 
            this.active_channel.channel_valid = 1;

            #1;

            for (int j=0;j<cycles;j++) begin

                // immediate assert
                if(active_channel.channel_ready == 1) begin
                    // next cycle reset all
                    $display("[DST_AGENT] data get from fifo : %b !", this.active_channel.channel_data);
                    @(posedge active_channel.clk); 
                end else begin
                    // hold and waiting for ready
                    for (int i=0;i<10;i++) begin
                        @(posedge active_channel.clk);  
                        if(active_channel.channel_ready == 1) begin
                            $display("[DST_AGENT] data get from fifo : %b !", this.active_channel.channel_data);
                            i = 10;
                            @(posedge active_channel.clk);  
                        end else begin
                            i = 1;
                        end       
                    end
                end  

            end

            // now the ready is received, drive the signal when next clk posedge    
            this.active_channel.channel_valid = 0;
                    
        endtask
    endclass

endpackage



package dst_agent;

    import dst_agnent_objects ::*;

    class dst_agent;

        dst_driver dst_driver0;

        function new();
            this.dst_driver0 = new();
        endfunction

        function void set_interface(
            virtual duttb_intf_destinationchannel.TBconnect dch
        );   
            this.dst_driver0.set_interface(dch);
        endfunction   

        task single_get();
            logic [2:0] fifo_data;
            this.dst_driver0.fifo_data_get(fifo_data);
            $display("[DST_AGENT] data get from fifo : %b !", fifo_data); 
        endtask

        task always_get(
            input int cycles
        );
            this.dst_driver0.fifo_data_alwaysget(cycles);
        endtask

    endclass


endpackage
