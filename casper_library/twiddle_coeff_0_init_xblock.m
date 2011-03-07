function twiddle_coeff_0_init_xblock(FFTSize, input_bit_width, add_latency, mult_latency, bram_latency, conv_latency, opt_target)



%% inports
xlsub2_a = xInport('a');
xlsub2_b = xInport('b');
xlsub2_sync = xInport('sync');

%% outports
xlsub2_a_re = xOutport('a_re');
xlsub2_a_im = xOutport('a_im');
xlsub2_bw_re = xOutport('bw_re');
xlsub2_bw_im = xOutport('bw_im');
xlsub2_sync_out = xOutport('sync_out');



%% initialization script
if(strcmp(opt_target, 'logic')), 
    latency = mult_latency+add_latency+bram_latency+conv_latency;
else
    latency = mult_latency+add_latency*2+bram_latency+conv_latency;
end


%% diagram

% block: twiddles_collections/twiddle_coeff_0/c_to_ri
xlsub2_delay0_out1 = xSignal;
xlsub2_c_to_ri = xBlock(struct('source', str2func('c_to_ri_xblock'), 'name', 'c_to_ri'), ...
                        {input_bit_width, ...
                         input_bit_width-1}, ...
                        {xlsub2_delay0_out1}, ...
                        {xlsub2_a_re, xlsub2_a_im});

% block: twiddles_collections/twiddle_coeff_0/c_to_ri1
xlsub2_delay1_out1 = xSignal;
xlsub2_c_to_ri1 = xBlock(struct('source', str2func('c_to_ri_xblock'), 'name', 'c_to_ri1'), ...
                        {input_bit_width, ...
                         input_bit_width-1}, ...
                         {xlsub2_delay1_out1}, ...
                         {xlsub2_bw_re, xlsub2_bw_im});

% block: twiddles_collections/twiddle_coeff_0/delay0
xlsub2_delay0 = xBlock(struct('source', 'Delay', 'name', 'delay0'), ...
                       struct('latency', latency, ...
                              'reg_retiming', 'on'), ...
                       {xlsub2_a}, ...
                       {xlsub2_delay0_out1});

% block: twiddles_collections/twiddle_coeff_0/delay1
xlsub2_delay1 = xBlock(struct('source', 'Delay', 'name', 'delay1'), ...
                       struct('latency', latency, ...
                              'reg_retiming', 'on'), ...
                       {xlsub2_b}, ...
                       {xlsub2_delay1_out1});

% block: twiddles_collections/twiddle_coeff_0/delay2
xlsub2_delay2 = xBlock(struct('source', 'Delay', 'name', 'delay2'), ...
                       struct('latency', latency, ...
                              'reg_retiming', 'on'), ...
                       {xlsub2_sync}, ...
                       {xlsub2_sync_out});



end

