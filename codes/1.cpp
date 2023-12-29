#include <bits/stdc++.h>
using namespace std;

struct Acceptor {
    int begin_state; // q_0
    char stack_char; // $
    set<char> input_alphabet; // X
    map<int, map<pair<char,char>, set<pair<int,string>>>> transitions; // δ
    set<int> accept_states; // Q_A
};

void replace_top(stack<char> &s, string new_top){
    s.pop();
    for(int i=new_top.size()-1; i>=0; i--){
        if(new_top[i] != 'e') s.push(new_top[i]);
    }
}

bool accepts(Acceptor a, string input){
    queue<tuple<int, stack<char>, string>> q;
    set<tuple<int, stack<char>, string>> vis;
    stack<char> s; s.push(a.stack_char);
    q.push({a.begin_state, s, input});
    vis.insert({a.begin_state, s, input});
    while(!q.empty()){
        tuple<int, stack<char>, string> f = q.front(); q.pop();
        if(get<2>(f).size() == 0 && a.accept_states.count(get<0>(f)))
            return true;

        set<tuple<int,stack<char>, string>> nexts;
        if(get<2>(f).size()>0){
            for(auto next: a.transitions[get<0>(f)][{get<2>(f)[0], get<1>(f).top()}]){
                tuple<int, stack<char>, string> n = f;
                get<0>(n) = next.first;
                replace_top(get<1>(n), next.second);
                get<2>(n) = get<2>(n).substr(1);
                nexts.insert(n);
            }
        }
        for(auto next: a.transitions[get<0>(f)][{'e', get<1>(f).top()}]){
            tuple<int, stack<char>, string> n = f;
            get<0>(n) = next.first;
            replace_top(get<1>(n), next.second);
            nexts.insert(n);
        }
        for(auto next: nexts){
            if(vis.count(next)) continue;
            vis.insert(next);
            q.push(next);
        }
    }
    return false;
}

set<string> words_less_than(int length){
    set<string> words;
    for(int l=0;l<length;l++){
        for(int i=0; i<pow(2, l); i++){
            string word = "";
            for (int j=0; j<l; j++)
                word += to_string((i >> j) & 1);
            words.insert(word);
        }
    }
    return words;
}

int main() {
    Acceptor a;
    a.input_alphabet = {'0', '1'};
    a.stack_char = '$';
    a.accept_states = {0};
    a.begin_state = 0;
    a.transitions[0] = {
        {{'e', '$'}, {{1, "z$"}}}
    };
    a.transitions[1] = {
        {{'0', 'z'}, {{1, "zzz"}}},
        {{'e', 'z'}, {{2, "e"}}}
    };
    a.transitions[2] = {
        {{'1', 'z'}, {{2, "e"}, {1, "zz"}}},
        {{'0', 'z'}, {{0, "e"}}},
    };

    // get all words with length less than 5
    set<string> words = words_less_than(5);
    cout<<"Words with length less than 5: ";
    for (string word : words){
        cout<<"\""<<word<<"\""<<" ";
    }
    cout<<endl;

    cout<<"Accepted words: ";
    for (string word : words){
        if (accepts(a, word)){
            cout<<"\""<<word<<"\""<<" ";
        }
    }
}