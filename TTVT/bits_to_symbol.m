function [ symbols ] = bits_to_symbol(word_length,block_lenght,bits_seq)
    N=block_lenght*word_length;
    symbols=zeros(1,block_lenght);
    if (N ~= length(bits_seq))
        error('bits_seq_to_symbol: check bits_seq.length()');
    end
    k=1;
    for j=1:block_lenght
        for i=1:word_length
            symbols(1,j)= symbols(1,j)+ (bits_seq(1,(k))*bitshift(1,(i-1)));
            k=k+1;
        end
    end
end

