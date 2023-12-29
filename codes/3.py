words = [""]

for length in range(1, 5):
    new_words = []
    for word in words:
        if len(word) == length - 1:
            new_words.extend([word + 'a', word + 'b'])
    words.extend(new_words)

for word in words:
    state=[1, 0]
    for letter in word:
        new_state = [0, 0]
        if letter == 'a':
            new_state[0] += 1.0*state[1]
            new_state[1] += 1.0*state[0]
        else:
            new_state[0] += (1/7)*state[1]
            new_state[1] += (6/7)*state[1]
            new_state[1] += (6/7)*state[0]
            new_state[0] += (1/7)*state[0]
        state = new_state
    if state[0] > 0.5:
        print(f'"{word}"')