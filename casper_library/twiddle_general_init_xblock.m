%% Xblock twiddles, including: twiddle_coeff_0, twiddle_coeff_1,
%% twiddle_general_3mult, twiddle_general_4mult, twiddle_general_dsp48e,
%% twiddle_pass_through, twiddle_stage_2


function twiddle_general_init_xblock(twiddle_type, varargin)

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

disp('start switching...')
disp(twiddle_type)
switch twiddle_type
    case 'twiddle_coeff_0'

        defaults = {'FFTSize', 4, 'input_bit_width', 18, ...
           'add_latency', 1, 'mult_latency', 2, ...
           'conv_latency', 1, 'bram_latency', 2, ...
           'opt_target','logic'};
        FFTSize = get_var('FFTSize', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        opt_target = get_var('opt_target', 'defaults', defaults, varargin{:});
        
        twiddle_coeff_0_config.source=str2func('twiddle_coeff_0_init_xblock');
        twiddle_coeff_0_config.name = 'twiddle_coeff_0_xblock';
        twiddle_coeff_0_sub = xBlock(twiddle_coeff_0_config,{FFTSize,input_bit_width,add_latency,mult_latency, bram_latency, conv_latency, opt_target});
        twiddle_coeff_0_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});

	 disp('twiddle_coeff_0_xblock');



    case 'twiddle_coeff_1'

        defaults = {'FFTSize', 4, 'input_bit_width', 18, ...
           'add_latency', 1, 'mult_latency', 2, ...
           'conv_latency', 1, 'bram_latency', 2, ...
           'opt_target','logic'};
        FFTSize = get_var('FFTSize', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        opt_target = get_var('opt_target', 'defaults', defaults, varargin{:});
        
        twiddle_coeff_1_config.source=str2func('twiddle_coeff_1_init_xblock');
        twiddle_coeff_1_config.name = 'twiddle_coeff_1_xblock';
        twiddle_coeff_1_sub = xBlock(twiddle_coeff_1_config,{FFTSize,input_bit_width,add_latency,mult_latency, bram_latency, conv_latency, opt_target});
        twiddle_coeff_1_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});
	 disp('twiddle_coeff_1_xblock');

    case 'twiddle_general_3mult'



        defaults = {'Coeffs', [0, j], 'StepPeriod', 0, 'input_bit_width', 18, ...
            'coeff_bit_width', 18,'add_latency', 1, 'mult_latency', 2, ...
            'conv_latency', 1, 'bram_latency', 2, 'arch', 'Virtex5', ...
            'coeffs_bram', 'off', 'use_hdl', 'off', 'use_embedded', 'off', ...
            'quantization', 'Round  (unbiased: +/- Inf)', 'overflow', 'Wrap'};
        Coeffs = get_var('Coeffs', 'defaults', defaults, varargin{:});
        StepPeriod = get_var('StepPeriod', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        coeff_bit_width = get_var('coeff_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        arch = get_var('arch', 'defaults', defaults, varargin{:});
        coeffs_bram = get_var('coeffs_bram', 'defaults', defaults, varargin{:});
        use_hdl = get_var('use_hdl', 'defaults', defaults, varargin{:});
        use_embedded = get_var('use_embedded', 'defaults', defaults, varargin{:});
        quantization = get_var('quantization', 'defaults', defaults, varargin{:});
        overflow = get_var('overflow', 'defaults', defaults, varargin{:});
        
        twiddle_general_3mult_config.source=str2func('twiddle_general_3mult_init_xblock');
        twiddle_general_3mult_config.name = 'twiddle_general_3mult_xblock';
        twiddle_general_3mult_sub = xBlock(twiddle_general_3mult_config,{Coeffs, StepPeriod, coeffs_bram, coeff_bit_width, input_bit_width, add_latency, mult_latency, bram_latency, conv_latency, arch, use_hdl, use_embedded, quantization, overflow});
        twiddle_general_3mult_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});
	 disp('twiddle_general_3mult_xblock');


    case 'twiddle_general_4mult'

        defaults = {'Coeffs', [0, j], 'StepPeriod', 0, 'input_bit_width', 18, ...
            'coeff_bit_width', 18,'add_latency', 1, 'mult_latency', 2, ...
            'conv_latency', 1, 'bram_latency', 2, 'arch', 'Virtex5', ...
            'coeffs_bram', 'off', 'use_hdl', 'off', 'use_embedded', 'off', ...
            'quantization', 'Round  (unbiased: +/- Inf)', 'overflow', 'Wrap'};
        Coeffs = get_var('Coeffs', 'defaults', defaults, varargin{:});
        StepPeriod = get_var('StepPeriod', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        coeff_bit_width = get_var('coeff_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        arch = get_var('arch', 'defaults', defaults, varargin{:});
        coeffs_bram = get_var('coeffs_bram', 'defaults', defaults, varargin{:});
        use_hdl = get_var('use_hdl', 'defaults', defaults, varargin{:});
        use_embedded = get_var('use_embedded', 'defaults', defaults, varargin{:});
        quantization = get_var('quantization', 'defaults', defaults, varargin{:});
        overflow = get_var('overflow', 'defaults', defaults, varargin{:});
        
        twiddle_general_4mult_config.source=str2func('twiddle_general_4mult_init_xblock');
        twiddle_general_4mult_config.name = 'twiddle_general_4mult_xblock';
        twiddle_general_4mult_sub = xBlock(twiddle_general_4mult_config,{Coeffs, StepPeriod, coeffs_bram, coeff_bit_width, input_bit_width, add_latency, mult_latency, bram_latency, conv_latency, arch, use_hdl, use_embedded, quantization, overflow});
        twiddle_general_4mult_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});
	 disp('twiddle_general_4mult_xblock');




    case 'twiddle_general_dsp48e'

        defaults = { ...
            'Coeffs', [0, j], ...
            'StepPeriod', 0, ...
            'input_bit_width', 18, ...
            'coeff_bit_width', 18, ...
            'bram_latency', 2, ...
            'conv_latency', 1, ...
            'arch', 'Virtex5', ...
            'quantization', 'Round  (unbiased: +/- Inf)', ...
            'overflow', 'Wrap', ...
            'coeffs_bram', 'off', ...
        };
        Coeffs = get_var('Coeffs', 'defaults', defaults, varargin{:});
        StepPeriod = get_var('StepPeriod', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        coeff_bit_width = get_var('coeff_bit_width', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        arch = get_var('arch', 'defaults', defaults, varargin{:});
        quantization = get_var('quantization', 'defaults', defaults, varargin{:});
        overflow = get_var('overflow', 'defaults', defaults, varargin{:});
        coeffs_bram = get_var('coeffs_bram', 'defaults', defaults, varargin{:});
        twiddle_general_dsp48e_config.source=str2func('twiddle_general_dsp48e_init_xblock');
        twiddle_general_dsp48e_config.name = 'twiddle_general_dsp48e_xblock';
        twiddle_general_dsp48e_sub = xBlock(twiddle_general_dsp48e_config,{Coeffs, StepPeriod, coeff_bit_width, input_bit_width, bram_latency, conv_latency, quantization, overflow, arch, coeffs_bram});
        twiddle_general_dsp48e_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});


	 disp('twiddle_general_dsp48e_xblock');


 case 'twiddle_pass_through'

        defaults = {'FFTSize', 4, 'input_bit_width', 18, ...
           'add_latency', 1, 'mult_latency', 2, ...
           'conv_latency', 1, 'bram_latency', 2, ...
           'opt_target','logic'};
        FFTSize = get_var('FFTSize', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        opt_target = get_var('opt_target', 'defaults', defaults, varargin{:});
        twiddle_pass_through_config.source=str2func('twiddle_pass_through_init_xblock');
        twiddle_pass_through_config.name = 'twiddle_pass_through_xblock';
        twiddle_pass_through_sub = xBlock(twiddle_pass_through_config,{FFTSize,input_bit_width,add_latency,mult_latency, bram_latency, conv_latency, opt_target});
        twiddle_pass_through_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});
	 disp('twiddle_pass_through_xblock');

    case 'twiddle_stage_2'

         defaults = {'FFTSize', 4, 'input_bit_width', 18, ...
           'add_latency', 1, 'mult_latency', 2, ...
           'conv_latency', 1, 'bram_latency', 2, ...
           'opt_target','logic'};
        FFTSize = get_var('FFTSize', 'defaults', defaults, varargin{:});
        input_bit_width = get_var('input_bit_width', 'defaults', defaults, varargin{:});
        add_latency = get_var('add_latency', 'defaults', defaults, varargin{:});
        mult_latency = get_var('mult_latency', 'defaults', defaults, varargin{:});
        bram_latency = get_var('bram_latency', 'defaults', defaults, varargin{:});
        conv_latency = get_var('conv_latency', 'defaults', defaults, varargin{:});
        opt_target = get_var('opt_target', 'defaults', defaults, varargin{:});
        twiddle_stage_2_config.source=str2func('twiddle_stage_2_init_xblock');
        twiddle_stage_2_config.name = 'twiddle_stage_2_xblock';
        twiddle_stage_2_sub = xBlock(twiddle_stage_2_config,{FFTSize,input_bit_width,add_latency,mult_latency, bram_latency, conv_latency, opt_target});
        twiddle_stage_2_sub.bindPort({xlsub2_a,xlsub2_b,xlsub2_sync},{xlsub2_a_re,xlsub2_a_im,xlsub2_bw_re,xlsub2_bw_im,xlsub2_sync_out});
	 disp('twiddle_stage_2_xblock')
     
    otherwise
        disp('Error! This twiddle type is not supported');
end
end