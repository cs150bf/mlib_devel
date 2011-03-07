function twiddle_pass_through_init_xblock(FFTSize, input_bit_width, add_latency, mult_latency, bram_latency, conv_latency, opt_target)



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

%% diagram

% block: twiddle_pass_through_details/twiddle_pass_through/c_to_ri
xlsub2_c_to_ri = xBlock(struct('source', str2func('c_to_ri_xblock'), 'name', 'c_to_ri'), ...
                        {input_bit_width, ...
                         input_bit_width-1}, ...
                        {xlsub2_a}, ...
                        {xlsub2_a_re, xlsub2_a_im});

% block: twiddle_pass_through_details/twiddle_pass_through/c_to_ri1
xlsub2_c_to_ri1 = xBlock(struct('source', str2func('c_to_ri_xblock'), 'name', 'c_to_ri1'), ...
                         {  input_bit_width, ...
                            input_bit_width-1}, ...
                         {xlsub2_b}, ...
                         {xlsub2_bw_re, xlsub2_bw_im});

% extra outport assignment
xlsub2_sync_out.assign(xlsub2_sync);


end

