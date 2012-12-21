function get_mlibVersion()

mlib_path = which('casper_library');
if isempty(mlib_path)
    disp('casper_library not found, please load casper_library first.')
end

substrind = strfind(mlib_path, '/casper_library.mdl');
mlib_path = mlib_path(1:substrind-1);
disp(['casper_library path:', mlib_path]);

type(fullfile(mlib_path, '../.git/refs/heads/master'));

currentFolder = pwd;
cd(mlib_path);
!git log --max-count=1
cd(currentFolder);

end