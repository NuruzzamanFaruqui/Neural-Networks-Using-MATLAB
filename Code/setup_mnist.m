% setup_mnist.m
% Downloads the MNIST test set and puts it where Chapters 6 and 7 expect it.
%
% Run this ONCE, from any folder:   >> setup_mnist
%
% It creates a folder named MNIST inside Chapter_6 and inside Chapter_7 and
% saves these two files in each of them (the names use dots, as in the book):
%     t10k-images.idx3-ubyte     t10k-labels.idx1-ubyte
% MNIST is a public dataset of 70,000 handwritten digits (Yann LeCun et al.).
% The two files used here hold the 10,000 test images and their labels.

base  = 'https://ossci-datasets.s3.amazonaws.com/mnist/';
names = {'t10k-images-idx3-ubyte', 't10k-labels-idx1-ubyte'};      % file names on the server
final = {'t10k-images.idx3-ubyte', 't10k-labels.idx1-ubyte'};      % file names the book uses

here    = fileparts(mfilename('fullpath'));
targets = {fullfile(here, 'Chapter_6', 'MNIST'), fullfile(here, 'Chapter_7', 'MNIST')};

work = tempname;  mkdir(work);

for k = 1:2
  gz = fullfile(work, [names{k} '.gz']);
  fprintf('Downloading %s ...\n', names{k});
  websave(gz, [base names{k} '.gz']);
  gunzip(gz, work);                                  % creates work/<names{k}>
  for t = 1:numel(targets)
    if ~exist(targets{t}, 'dir'), mkdir(targets{t}); end
    copyfile(fullfile(work, names{k}), fullfile(targets{t}, final{k}));
  end
end

rmdir(work, 's');
fprintf('Done. MNIST is ready in:\n  %s\n  %s\n', targets{1}, targets{2});
